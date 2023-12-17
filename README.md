# 2022_DCPT_LET_timepix
Derived from https://github.com/APTG/2022_DCPT_LET for timepix setup.


## Plans
- **plan 2** is the plan from https://github.com/APTG/2022_DCPT_LET/tree/main/data/resources/plans/plan2_160MeV
- **plan 4** is derived from https://github.com/APTG/2022_DCPT_LET/tree/main/data/resources/plans/plan1_sobp, which originally is a SOBP plan.
Only the 149 MeV layer was given, because "research mode" was used to lower fluence rate for the minipix detector.
At the moment, the full SOBP dicom is uploaded, spots are removed from the spotlist instead.

## Phantom geometry and scoring
Described in https://github.com/APTG/2022_DCPT_LET_timepix/blob/main/docs/setup.md


### Plan 2 ###
For plan 2, the standard setup was used from https://github.com/APTG/2022_DCPT_LET
This means the measurement position was at 2.0 of SW and 0.25 cm of PMMA, measured from the phantom surface.
The isocenter plane coincides with the measurement position.
The minipix detectors were in the "position 2" configuration, which is located at 11 to 13 cm laterally from center axis.
- **Pos3**:
  - x(-7,-5) y(-0.5,0.5) z(-0.1,0.1) [20,1,1] bins


### Plan 4 ###
For plan 4, contrary to the reference experiment, here the isocenter was moved to the distal edge, positioned after 15 cm of SW and 0.25 cm of PMMA.
Three measurement depth were used for plan 4.
Depth was varied by adding more SW before the PMMA plate, without chaning the isocenter position [TBC].
For depth _a and _b the minipix detectors were in the "position 2" configuration, which is located at 11 to 13 cm laterally from center axis.
For depth _c the minipix detectors were in "position 3" configuration, which is located 5 to 7 cm laterally from the center axis.


- **Pos2_a**:
  - x(-13,-11) y(-0.5,0.5) z(-0.1,0.1) [20,1,1] bins
- **Pos2_b**:
  - x(-13,-11) y(-0.5,0.5) z(0.1,0.3) [20,1,1] bins
- **Pos3_c**:
  - x(-13,-11) y(-0.5,0.5) z(0.6,0.8) [20,1,1] bins

## Additional Notes
See https://github.com/APTG/2022_DCPT_LET/issues/42

