# Mobile Machine Demo

## Date: 05.03.2026

## Introduction

This sample project demonstrates how to build mobile machine control applications using Automation Studio.
It showcases practical implementations of key communication protocols and input/output interfaces commonly used in modern mobile automation systems.
The project includes examples like CanOpen, LIN bus and Isobus — providing a complete reference for developing responsive, reliable operator interfaces in mobile machines.
Whether you're a system integrator, automation engineer or evaluating AS for your mobile automation needs, this project illustrates best practices and accelerates your implementation journey.



## Target audience \& Purpose

* Sales:

  * Present mobile automation specific AS features
  * Demonstrate real-world use cases and technical capabilities
  * Support PoC phases with minimal additional development

* Automation Engineers:

  * Getting started with mobile specific topics combined in one sample project
  * Check out best practices
  * Use independent tasks as a template for projects and implementations



## Features

* CanOpen

  * Used for the communication of Blink keypad: blinkmarine.com/products/pkp-2300-si
  * Manages keypad inputs and LED outputs over CanOpen protocol
  * Handles multiple buttons with multitouch prevention
  * Find datasheet in the documentation package



* J1939

  * Mapp component used, example for J1939 communication
  * Possible to test with one X90 (IF7 \& IF8), termination resistor needed!
  * Generic for predefined PGNs \& receive for NOT predefined ones
  * List of all predefined PGNs can be found in J1939Generic configuration or AS help (55d89aac-e61e-4ea7-8d10-1f6327c76cfa)



* Standby Mode

  * Example for standby mode implementation, ONLY possible for X90CP154.xx
  * Enters standby at TimeStampHour:TimeStampMinute
  * Wake up triggers defined:

    * Status ignition
    * 5 minutes elapsed



* PWM Control

  * PWM with current control (closed loop control)
  * PID controller from MT-Basics library used
  * Channel 39 used as PWM output with dither



* Lin-Bus

  * Example from the AS help, no simulation of the lin communication possible
  * Marquardt Rocker Switch Series 3270 is used



* Isobus

  * Example from the AS help, can NOT be built in simulation (disabled by default)
  * Can be tested with X90 and IsoSimulate\_vt to simulate Isobus panel
  * Custom visualization can be developed with VtDesigner (tool from our partner OSB)



* Visualization

  * Used for example visualization of a harvesting cockpit
  * Alarms, SDM \& Mapp Cockpit included
  * Sequece for demo purposes



* Simulation

  * Used for Digital Twin simulation with Robot Studio
  * Controllable from HMI or hardware joysticks
  * An example video of what is possible can be found in the documentation package
  * RS Model can be found in repository
  * In RS in Simulation/StationLogic/OpcUAClient the IP address must be adapted (localhost for simulation)

