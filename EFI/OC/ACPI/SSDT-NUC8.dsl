/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLzDvQ2o.aml, Sun Sep 10 11:35:04 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000006A1 (1697)
 *     Revision         0x02
 *     Checksum         0xAB
 *     OEM ID           "APPLE"
 *     OEM Table ID     "NUC8"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "APPLE", "NUC8", 0x00000000)
{
    External (_GPE.XTFY, MethodObj)    // 2 Arguments
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC.XSTA, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX.AVND, IntObj)
    External (_SB_.PCI0.RP05.PXSX.TBDU.XHC_, DeviceObj)
    External (_SB_.PCI0.RP05.TBSE, FieldUnitObj)
    External (_SB_.PCI0.RP15, DeviceObj)
    External (_SB_.PCI0.RP15.PXSX, DeviceObj)
    External (_SB_.PCI0.XDCI, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.TBFP, MethodObj)    // 2 Arguments
    External (ADBG, MethodObj)    // 1 Arguments
    External (DVID, FieldUnitObj)
    External (HPTE, IntObj)
    External (NOHP, FieldUnitObj)
    External (P8XH, MethodObj)    // 2 Arguments
    External (STAS, IntObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            STAS = One
            HPTE = Zero
        }

        Scope (_GPE)
        {
            Method (NTFY, 2, Serialized)
            {
                If (_OSI ("Darwin"))
                {
                    ADBG ("NTFY")
                    If ((NOHP == One))
                    {
                        If ((Arg1 == One))
                        {
                            Switch (ToInteger (Arg0))
                            {
                                Case (0x05)
                                {
                                    Notify (\_SB.PCI0.RP05.PXSX.DSB0.NHI0, Zero) // Bus Check
                                    Notify (\_SB.PCI0.RP05.PXSX.TBDU.XHC, Zero) // Bus Check
                                    Notify (\_SB.PCI0.XHC, Zero) // Bus Check
                                }

                            }
                        }
                    }

                    P8XH (Zero, 0xC2)
                    P8XH (One, 0xC2)
                }

                Return (\_GPE.XTFY (Arg0, Arg1))
            }
        }

        Scope (_SB)
        {
            Scope (PR00)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }

            Scope (PCI0)
            {
                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (XDCI)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((DVID != 0xFFFF))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (RP05)
                {
                    Method (PINI, 0, NotSerialized)
                    {
                        If (_OSI ("Darwin"))
                        {
                            \_SB.TBFP (One, One)
                            Local0 = 0x2710
                            While (((Local0 > Zero) && (\_SB.PCI0.RP05.PXSX.AVND == 0xFFFFFFFF)))
                            {
                                Sleep (One)
                                Local0--
                            }
                        }
                        Else
                        {
                        }
                    }

                    Scope (PXSX)
                    {
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            If (_OSI ("Darwin"))
                            {
                                If ((Arg2 == Zero))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x02)
                                {
                                    "PCI-Thunderbolt", 
                                    One
                                })
                            }

                            Return (Zero)
                        }

                        Device (DSB0)
                        {
                            Name (_ADR, Zero)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If (_OSI ("Darwin"))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                            {
                                Return (Package (0x02)
                                {
                                    0x69, 
                                    0x03
                                })
                            }

                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If (_OSI ("Darwin"))
                                {
                                    If ((Arg2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Return (Package (0x02)
                                    {
                                        "PCIHotplugCapable", 
                                        Zero
                                    })
                                }

                                Return (Zero)
                            }

                            Device (NHI0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Name (_STR, Unicode ("Thunderbolt"))  // _STR: Description String
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    If (_OSI ("Darwin"))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (Package (0x02)
                                    {
                                        0x69, 
                                        0x03
                                    })
                                }

                                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                                {
                                    If (_OSI ("Darwin"))
                                    {
                                        If ((Arg2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                        }

                                        Return (Package (0x03)
                                        {
                                            "power-save", 
                                            One, 
                                            Buffer (One)
                                            {
                                                 0x00                                             // .
                                            }
                                        })
                                    }

                                    Return (Zero)
                                }
                            }
                        }

                        Device (DSB1)
                        {
                            Name (_ADR, 0x00010000)  // _ADR: Address
                            Name (_SUN, One)  // _SUN: Slot User Number
                            Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                            {
                                Return (Zero)
                            }

                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If (_OSI ("Darwin"))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                            {
                                Return (Package (0x02)
                                {
                                    0x69, 
                                    0x03
                                })
                            }

                            Device (DEV0)
                            {
                                Name (_ADR, Zero)  // _ADR: Address
                                Method (_STA, 0, NotSerialized)  // _STA: Status
                                {
                                    If (_OSI ("Darwin"))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }

                                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                                {
                                    Return (One)
                                }

                                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                                {
                                    Return (Package (0x02)
                                    {
                                        0x69, 
                                        0x03
                                    })
                                }
                            }
                        }
                    }
                }

                Scope (RP15)
                {
                    Scope (PXSX)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                    }

                    Device (SDXC)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (LPCB)
                {
                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Scope (H_EC)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (\_SB.PCI0.LPCB.H_EC.XSTA ())
                            }
                        }
                    }

                    Device (PMCR)
                    {
                        Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            Memory32Fixed (ReadWrite,
                                0xFE000000,         // Address Base
                                0x00010000,         // Address Length
                                )
                        })
                    }
                }
            }
        }
    }
}

