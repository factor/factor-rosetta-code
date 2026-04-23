! The NKTg Law on Varying Inertia: The movement tendency of an object in
! space depends on the relationship between its position, velocity, and
! mass
! 
!    NKTg = f(x, v, m)
! 
! - In which:
! 
!  - x is the position or displacement of the object relative to the reference point.
!  - v is the velocity.
!  - m is the mass.
! 
! - The movement tendency of the object is determined by the following
! basic product quantities:
! 
!    NKTg₁ = x × p
!    NKTg₂ = (dm/dt) × p
! 
! - In which:
! 
!  - p is the linear momentum, calculated by p = m × v.
!  - dm/dt is the rate of mass change over time.
!  - NKTg₁ is the quantity representing the product of position and momentum.
!  - NKTg₂ is the quantity representing the product of mass variation and momentum.
! 
! - The unit of measurement is NKTm, representing a unit of varying
! inertia.
! 
! - The sign and value of the two quantities NKTg₁ and NKTg₂ determine the
! movement tendency:
! 
!  - If NKTg₁ is positive, the object tends to move away from the stable state.
!  - If NKTg₁ is negative, the object tends to move toward the stable state.
!  - If NKTg₂ is positive, the mass variation has a supporting effect on the movement.
!  - If NKTg₂ is negative, the mass variation has a resisting effect on the movement.
! 
! - The stable state in this law is understood as the state in which the
! position (x), velocity (v), and mass (m) of the object interact with
! each other to maintain the movement structure, helping the object avoid
! losing control and preserving its inherent movement pattern.
! 
! The NKTg Law on Varying Inertia
! 
! Given position x, velocity v, mass m, and mass change rate dm/dt,
! compute the following quantities:
! 
! 1. Linear momentum:
! 
!     p = m·v
! 
! 2. NKTg₁:
! 
!     NKTg₁ = x·p
! 
! 3. NKTg₂:
! 
!     NKTg₂ = (dm/dt)·p
! 
! 4. Determine motion tendency:
! 
!     If NKTg₁ > 0 → moving away from stable state
!     If NKTg₁ < 0 → moving toward stable state
!     If NKTg₂ > 0 → mass variation supports motion
!     If NKTg₂ < 0 → mass variation resists motion
! 
! Programs should output p, NKTg₁, NKTg₂, and the interpreted motion
! tendency.
! 
! Use any reasonable numeric test values.
! 
! Subtasks
! 
! -   Experimental Verification of the NKT Law: Interpolating the Masses
!     of 8 Planets Using NASA Data as of 30–31/12/2024
! 
! -   Experimental Verification of the NKTg Law Using NASA Neptune Data
!     (2023–2024)
! 
! -   Experimental Verification of the NKTg Law Using NASA Mercury Data in
!     2025
! 
! -   Experimental Verification of the NKTg Law in Earth Orbit Based on
!     NASA’s 2025 Earth Dataset
! 
!     with Ada.Text_IO;         use Ada.Text_IO;
!     with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
! 
!     procedure NKTgLaw is
! 
!        type NKTg is record
!           P         : Float;
!           NKTg1     : Float;
!           NKTg2     : Float;
!           Tendency1 : String (1 .. 32);
!           Tendency2 : String (1 .. 33);
!        end record;
! 
!        function Tendency1 (N : Float) return String is
!        begin
!           if N > 0.0 then
!              return "Moving away from stable state";
!           elsif N < 0.0 then
!              return "Moving toward stable state";
!           else
!              return "Stable equilibrium";
!           end if;
!        end Tendency1;
! 
!        function Tendency2 (N : Float) return String is
!        begin
!           if N > 0.0 then
!              return "Mass variation supports movement";
!           elsif N < 0.0 then
!              return "Mass variation resists movement";
!           else
!              return "No mass variation effect";
!           end if;
!        end Tendency2;
! 
!        function Compute (X, V, M, Dm_Dt : Float) return NKTg is
!           P  : Float := M * V;
!           N1 : Float := X * P;
!           N2 : Float := Dm_Dt * P;
!        begin
!           return (
!              P         => P,
!              NKTg1     => N1,
!              NKTg2     => N2,
!              Tendency1 => Tendency1(N1),
!              Tendency2 => Tendency2(N2)
!           );
!        end Compute;
! 
!        Result : NKTg;
! 
!     begin
!        Result := Compute (2.0, 3.0, 4.0, -0.5);
! 
!        Put_Line("{ p = " & Float'Image(Result.P));
!        Put_Line("  nktg1 = " & Float'Image(Result.NKTg1));
!        Put_Line("  nktg2 = " & Float'Image(Result.NKTg2));
!        Put_Line("  tendency1 = """ & Result.Tendency1 & """");
!        Put_Line("  tendency2 = """ & Result.Tendency2 & """ }");
!     end NKTgLaw;
! 
!     { p = 12.0
!       nktg1 = 24.0
!       nktg2 = -6.0
!       tendency1 = "Moving away from stable state"
!       tendency2 = "Mass variation resists movement" }


