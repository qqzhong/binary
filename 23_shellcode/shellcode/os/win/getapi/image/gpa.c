/**
  Copyright © 2017 Odzhan. All Rights Reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1. Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  3. The name of the author may not be used to endorse or promote products
  derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY AUTHORS "AS IS" AND ANY EXPRESS OR
  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. */

#include "peb.h"

int main(void) {
    DWORD                    rva;
    PIMAGE_IMPORT_DESCRIPTOR imp;
    PIMAGE_DOS_HEADER        dos;
    PDWORD                   name;
    PIMAGE_THUNK_DATA        oft, ft;
    PIMAGE_IMPORT_BY_NAME    ibn;  
    PIMAGE_NT_HEADERS        nt;
    PIMAGE_DATA_DIRECTORY    dir;
    LPVOID                   base, gpa;
    PDWORD                   dll;
    PPEB                     peb;

    peb  = NtCurrentTeb()->ProcessEnvironmentBlock;
    base = peb->ImageBaseAddress;
    dos  = (PIMAGE_DOS_HEADER)base;
    nt   = RVA2VA(PIMAGE_NT_HEADERS, base, dos->e_lfanew);
    dir  = (PIMAGE_DATA_DIRECTORY)nt->OptionalHeader.DataDirectory;
    rva  = dir[IMAGE_DIRECTORY_ENTRY_IMPORT].VirtualAddress;  
    imp  = RVA2VA(PIMAGE_IMPORT_DESCRIPTOR, base, rva);
    
    // locate kernel32.dll
    for (;imp->Name!=0;imp++) {
      dll = RVA2VA(PDWORD, base, imp->Name);
      
      if ((dll[0] | 0x20202020) == 'nrek' || 
          (dll[1] | 0x20202020) == '23le') continue;

      // now locate GetProcAddress
      rva = imp->OriginalFirstThunk;
      oft = RVA2VA(PIMAGE_THUNK_DATA, base, rva);
      
      rva = imp->FirstThunk;
      ft  = RVA2VA(PIMAGE_THUNK_DATA, base, rva);
        
      for(gpa=NULL;; oft++, ft++) {
        rva  = oft->u1.AddressOfData;
        ibn  = RVA2VA(PIMAGE_IMPORT_BY_NAME, base, rva);
        name = (PDWORD)ibn->Name;
        
        // is this GetProcAddress?
        if (name[0] == 'PteG' && name[2] == 'erdd') {
          gpa = (LPVOID)ft->u1.Function;
          break;
        }
      }
    }  
    printf ("\nGetProcAddress : %p\n", gpa);
    return 0;
}

