# The State (A Behavioral Design Pattern)

The State Design Pattern allows an object to alter its behavior when its internal state changes.

* Encapsulating conditional behavior into dedicated types leads to improved design
* The object's internal state affects its behavior


## Purpose
* Offer a structured approach for managing complex stat-dependent behaviours

## Benefits
* Eliminates large conditional statements
* Encapsulates state-specific behavior into concrete types
* Leads to elegant, easier to extend code.

## Structure
* Clients interact with the context
* Concrete state types encapsulate the behavior associated with a particular state


## Pitfalls
* Exposing states to clients
* State type explosion
* Performance considerations
* Maintenance issues
* Redundancy due to overlapping responsibilities in states.
