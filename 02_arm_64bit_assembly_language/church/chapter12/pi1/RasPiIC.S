// FILE: RasPiIC.s
// Functions to manage the Interrupt Controller on the
// Raspberry Pi
  // Address of Interrupt Controller
  .equ IC, 0x3F00B000
  // Register offsets
  .equ IRQBP, 0x200 // IRQ basic pending
  .equ IRQP1, 0x204 // IRQ pending 1
  .equ IRQP2, 0x208 // IRQ pending 2
  .equ FIQC, 0x20C // FIQ control
  .equ IRQEN1, 0x210 // IRQ enable 1
  .equ IRQEN2, 0x214 // IRQ enable 2
  .equ IRQBEN, 0x218 // Enable basic IRQs
  .equ IRQDA1, 0x21C // IRQ disable 1
  .equ IRQDA2, 0x220 // IRQ disable 2
  .equ IRQBDA, 0x224 // Disable basic IRQs
// ---------------------------------------------------------------
  .text
  .align 2
// ---------------------------------------------------------------
  // Initialization of the Interrupt Controller (IC)
  .global IC_init
IC_init:
  // disable all interrupts
  ldr x0,=IC
  mov x1,#0
  str w1,[x0,#IRQEN1]
  str w1,[x0,#IRQEN2]
  str w1,[x0,#IRQBEN]
  ret
// ---------------------------------------------------------------
// config_interrupt (int ID, int CPU);
// On Raspberry Pi, this just enables the timer interrupt
  .global config_interrupt
  config_interrupt:
  ldr x0,=IC
  mov x1,#1
  str w1,[x0,#IRQBEN]
  ret
// ---------------------------------------------------------------
// int get_interrupt_number();
// Get the interrupt ID for the current interrupt.
// On Raspberry Pi, just read and return the pending register.
  .global get_interrupt_number
get_interrupt_number: // Read the ICCIAR from the CPU Interface
  ldr x0,=IC
  ldr w0,[x0,#IRQBP]
  ret
// ---------------------------------------------------------------
// void end_of_interrupt(int ID);
// Notify the IC that the interrupt has been processed.
// On Raspberry Pi, this does nothing
  .global end_of_interrupt
end_of_interrupt:
  ret
