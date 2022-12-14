; Configuration file for Duet 3 MB 6HC (firmware version 3.3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.3.13 on Sun Oct 16 2022 20:05:35 GMT-1000 (Hawaii-Aleutian Standard Time)

; General preferences
M575 P1 S1 B57600                                  ; enable support for PanelDue
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M550 P"Luke's Test Configuration"                  ; set printer name
M669 K1                                            ; select CoreXY mode

; Wait a moment for the CAN expansion boards to start
G4 S2

; Network
M551 P"supersecretpassword"                        ; set password
M552 P0.0.0.0 S1                                   ; enable network and acquire dynamic address via DHCP
M586 P0 S1                                         ; enable HTTP
M586 P1 S0                                         ; disable FTP
M586 P2 S0                                         ; disable Telnet

; Drives
M569 P0.0 S1                                       ; physical drive 0.0 goes forwards
M569 P0.1 S1                                       ; physical drive 0.1 goes forwards
M569 P0.2 S1                                       ; physical drive 0.2 goes forwards
M569 P0.3 S1                                       ; physical drive 0.3 goes forwards
M569 P0.4 S1                                       ; physical drive 0.4 goes forwards
M584 X0.0 Y0.1 Z0.2 E0.3:0.4                       ; set drive mapping
M350 X16 Y16 Z16 E16:16 I1                         ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E420.00:420.00           ; set steps per mm
M566 X900.00 Y900.00 Z60.00 E120.00:120.00         ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z180.00 E1200.00:1200.00    ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z20.00 E250.00:250.00         ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E800:800 I30                   ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                   ; set axis minima
M208 X900 Y460 Z675 S0                             ; set axis maxima

; Endstops
M574 X1 S1 P"io0.in"                               ; configure switch-type (e.g. microswitch) endstop for low end on X via pin io0.in
M574 Y1 S1 P"io1.in"                               ; configure switch-type (e.g. microswitch) endstop for low end on Y via pin io1.in
M574 Z1 S1 P"io2.in"                               ; configure switch-type (e.g. microswitch) endstop for low end on Z via pin io2.in

; Z-Probe
M558 P1 C"temp0+io3.out" H5 F120 T6000             ; set Z probe type to unmodulated and the dive height + speeds
G31 P500 X0 Y0 Z2.5                                ; set Z probe trigger value, offset and trigger height
M557 X15:215 Y15:195 S20                           ; define mesh grid

; Heaters
M308 S0 P"temp1" Y"thermistor" T100000 B4138       ; configure sensor 0 as thermistor on pin temp1
M950 H0 C"out0" T0                                 ; create bed heater output on out0 and map it to sensor 0
M307 H0 B0 S1.00                                   ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                            ; map heated bed to heater 0
M143 H0 S160                                       ; set temperature limit for heater 0 to 160C
M308 S1 P"temp2" Y"thermistor" T100000 B4138       ; configure sensor 1 as thermistor on pin temp2
M950 H1 C"out1" T1                                 ; create nozzle heater output on out1 and map it to sensor 1
M307 H1 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit
M143 H1 S280                                       ; set temperature limit for heater 1 to 280C
M308 S2 P"temp3" Y"thermistor" T100000 B4138       ; configure sensor 2 as thermistor on pin temp3
M950 H2 C"out2" T2                                 ; create nozzle heater output on out2 and map it to sensor 2
M307 H2 B0 S1.00                                   ; disable bang-bang mode for heater  and set PWM limit
M143 H2 S280                                       ; set temperature limit for heater 2 to 280C

; Fans
M950 F0 C"out4" Q500                               ; create fan 0 on pin out4 and set its frequency
M106 P0 S0 H-1                                     ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"out5" Q500                               ; create fan 1 on pin out5 and set its frequency
M106 P1 S1 H0:1 T45                                ; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 S"E3D Assembly (0)" D0:1 H1:2 F0           ; define tool 0
G10 P0 X0 Y0 Z0                                    ; set tool 0 axis offsets
G10 P0 R0 S0                                       ; set initial tool 0 active and standby temperatures to 0C
M568 P0 S1                                         ; enable mixing for tool 0
M567 P0 E0.5:0.5                                   ; set mixing ratios for tool 0

; Custom settings are not defined

; Miscellaneous
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; set voltage thresholds and actions to run on power loss

