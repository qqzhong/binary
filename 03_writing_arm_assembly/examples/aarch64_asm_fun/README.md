# aarch64-fun
Writing some code for AArch64 ("arm64").

## Context?
I got a handful of single board computers with Aarch64 chips in them.
Most of them are A53s, though there's an A73 here somewhere...

I got a brand new one with 128 Maxwell GPU cores\*, but it only has
4GB of RAM. This board is *great*, but I want to write some very
performance-sensitive stuff for it to do image classification and stuff like
that. I already don't have the memory to spare  (Compiz's Revenge!), 
and want an excuse to go learn some dirty assembly hacks that the C compiler 
doesn't produce. (like `test eax, eax` on x86 versus `cmp eax, 0`, shave an 
immediate out, reduce cycles. We only have ~3.8 billion of them per second. 
Respect your computer. Everyone did that for the Z80 and 8086, you should for Zen
and A76 too... even though most C compilers should test for zero in a smart
way anyway.)

\* Technically, it's a system-on-module, but no one really cares about
the difference, unless you're putting this into a drone or handheld game
console or something. The important thing is CPU slow, GPU fast, compensate
to see if we can cram more data to the Maxwell per second?

Also because I want to eventually actually port Feral over to Aarch64.
(And I don't want to go fight with the vc4 GPU anyway quite yet. It's not fun
like Vega and Polaris! Maxwell might be fun though if I can reclock it... much
prefer Kepler but hey, it's a good GPU for a board like this, though
with Wayland and OpenCL working better (in my experience) with Kepler...)

And I don't really want to go and think about how much harder fighting with
VC6 is going to be. Might as well use Panfrost or something and go with
a totally different CPU/GPU.

## Why not RISC-V?
I'd love to get my hands on one, but an FPGA doesn't really cut it for me.
Sure, there's some in silicon and real, but I don't have one. I don't want 
to write code for a computer I don't actually have.... 
unless it's an Altair or something and you want to write yet-another-CPM-clone
in 1980-something.

Either way, I can't really justify the purchase on a chip that's not cheap
enough to basically be falling out of the sky every time it rains. They're
not literally everywhere like x86(-64) and Aarch32/64 either.

## Why not Aarch32?
Because Aarch64 is common in smartphones. A certain company with a name starting
with "G" and sort-of-rhymes with "noodle" makes an operating system for those
kinds of devices. And they want things to at least support a 64-bit mode, as
far as I'm aware.

What I'm saying is Aarch32 is legacy like x86. I don't want to bother, it's
on it's way out, at least for devices I currently care about. (I don't have
any -M processors, and MMU-less feels weird anyway for those sorts of embedded
devices... even though that makes more sense with DMA and all.)

But who knows, maybe a 32-bit RK3000-series will fall out of the sky one
day.
