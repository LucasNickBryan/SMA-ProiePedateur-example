# Multi-Agent System using GAMA

This project implements a multi-agent system using GAMA, a modeling and simulation platform. The system consists of three types of agents: Wolf, Rabbit, and Carrot.

## Agents

### Wolf
The Wolf agent represents the predator in the system. Its main objective is to hunt and consume Rabbits.

### Rabbit
The Rabbit agent represents the prey in the system. Its main objective is to avoid being caught by Wolves and to consume Carrots for sustenance.

### Carrot
The Carrot agent represents a food source in the system. It reproduces and disappears when it reaches a certain size.

## Agent Behaviors

### Wolf Behavior
- Hunting: Wolves actively search for Rabbits and pursue them.
- Consumption: When a Wolf catches a Rabbit, it consumes it for energy.

### Rabbit Behavior
- Evading: Rabbits try to avoid Wolves by moving away from them.
- Feeding: Rabbits search for and consume Carrots for nourishment.
- Reproduction: Rabbits can reproduce to increase their population.

### Carrot Behavior
- Reproduction: Carrots reproduce to maintain their population.
- Disappearance: Carrots disappear when they reach a certain size.

## Simulation

The simulation aims to model the interactions between Wolves, Rabbits, and Carrots in a dynamic environment. It allows for the study of predator-prey relationships and the effects of resource availability on population dynamics.

To run the simulation, make sure you have GAMA installed and execute the corresponding script.
