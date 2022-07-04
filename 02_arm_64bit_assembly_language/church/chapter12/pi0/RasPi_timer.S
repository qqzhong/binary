// FILE: RasPi_timer.s
// The timer runs off the 250MHz APB_clock source
  .equ TIMER_BASE, 0x3F008400
  .equ LOAD, 0x00 // Load
  .equ VALUE, 0x04 // Value (read only)
  .equ CONTROL,0x08 // Control
  .equ IRQACK, 0x0C // IRQ Clear/Ack (write only)
  .equ RAWIRQ, 0x10 // Raw IRQ (read only)
  .equ MSKIRQ, 0x14 // Masked IRQ (read only)
  .equ RELOAD, 0x18 // Reload
  .equ PREDIV, 0x1C // Pre-divider
  .equ COUNT, 0x20 // Free-running counter

  .text
  .align 2
// ---------------------------------------------------------------
// Configures and enables timer0 to generate interrupts at a
// fixed frequency. Also configures the Generic Interrupt
// Controller (GIC) to send interrupts to CPU 0.
  .global enable_timer
enable_timer:
  ldr x0,=TIMER_BASE
  mov x1,#0x7F // divide clock to 1,953,125Hz
  str w1,[x0,#PREDIV]
  ldr x1,=954 // should give about 8Hz
  str w1,[x0,#LOAD]
  ldr w1,=0b1111100000000010101010
  str w1,[x0,#CONTROL]
  ret
// ---------------------------------------------------------------
// int check_timer_interrupt()
// Check and clear the timer 0 interrupt. Returns 1 if the
// interrupt was active. Returns 0 otherwise.
  .global check_timer_interrupt
check_timer_interrupt:
  ldr x1,=TIMER_BASE
  ldr w0,[x1,#MSKIRQ]
  ands x0,x0,#1
  beq cti_ret
  str w0,[x1,#IRQACK]
cti_ret:ret
