+++
title = "Kosmorrolib - a library to calculate your ephemerides"
description = "Kosmorro's calculation logic, for the developers."

[extra]
show_toc = true
+++

# ![Kosmorrolib](/img/svg/kosmorrolib-logo-white.svg) <small>A library to compute your ephemerides</small>

Kosmorrolib is the Python library internally used in Kosmorro. It provides easy-to-use functions for your calculation needs.

The library is built on [Skyfield](https://rhodesmill.org/skyfield/), an excellent library designed to compute _"positions for the stars, planets, and satellites in orbit around the Earth"_.

## Install the library

Kosmorrolib is currently available in the version {{ lib_version }} and needs Python 3.7+ to work.

The library is available [on PyPI](https://pypi.org/project/kosmorrolib/), so you can install it directly with PIP:

```bash
pip install kosmorrolib
```

Note that Kosmorrolib follows the [Semantic versionning v2](https://semver.org/spec/v2.0.0.html) specification.

## Update the library

Updating the Kosmorrolib to the latest version is as simple as running the following command:

```bash
pip update kosmorrolib
```

Before updating, you may want to check the [changelog](@/lib/changelog.md) to know what changed since the previous version.

## Usage

Once you have installed Kosmorrolib, just import it in your Python script:

```python
#!/usr/bin/env python

import kosmorrolib
```

That's it: you're ready to use Kosmorrolib!

### Get the moon phase

#### Synopsis

```python
def get_moon_phase(
    for_date: datetime.date = datetime.date.today(), timezone: int = 0
) -> MoonPhase
```

Calculate and return the moon phase for the given date, adjusted to the given timezone if it is given.

#### Return

This function returns an object of type [`MoonPhase`](#moonphase).


#### Examples

Get the current moon phase:

```python
kosmorrolib.get_moon_phase()
```

Get the moon phase for the 27 March, 2021:

```python
kosmorrolib.get_moon_phase(datetime.date.fromisoformat("2021-03-27"))
```

Get the moon phase for the 27 March, 2021, in the UTC+2 timezone:

```python
kosmorrolib.get_moon_phase(datetime.date.fromisoformat("2021-03-27"), timezone=2)
```

### Get the ephemerides

#### Synopsis

```python
def get_ephemerides(
    position: Position, date: datetime.date = datetime.date.today(), timezone: int = 0
) -> [AsterEphemerides]
```

Compute and return the ephemerides for the given position and date, adjusted to the given timezone if any.

#### Return

This function returns an object of type [`AsterEphemerides`](#asterephemerides).

#### Examples

First, create a [`Position`](#position) object with your coordinates:

```python
pos = Position(50.5824, 3.0624)
```

Get the ephemerides for today:

```python
kosmorrolib.get_ephemerides(pos)
```

Get the ephemerides for June 9th, 2021:

```python
kosmorrolib.get_ephemerides(pos, datetime.date(2021, 6, 9))
```

### Get the events

#### Synopsis

```python
def get_events(
    for_date: date = date.today(), timezone: int = 0
) -> [Event]:
```

Calculate and return a list of events for the given date, adjusted to the given timezone if any.

#### Return

A list of objects of type [`Event`](#event).


#### Examples

Get the events for today:

```python
kosmorrolib.get_events()
```

Get the events for April 4th, 2020:

```python
kosmorrolib.get_events(date(2020, 4, 4))
```

## Objects model

Below are the definitions of the objects that you may have manipulate.

### `AsterEphemerides`

The ephemerides of an object.

#### Fields
- **`aster`**  
    An object of type [`Object`](#object).
- **`rise_time`**  
    A `datetime` representing the moment when the object rises.  
    If `None`, then the object does not rise.
- **`culmination_time`**  
    A `datetime` representing the moment when the object culminates.  
    If `None`, then the object does not culminate.
- **`set_time`**  
    A `datetime` representing the moment when the object sets.  
    If `None`, then the object does not set.

#### **Methods**:
- `serialize()`  
    Converts the object to a dictionnary.

### `Event`

#### Fields

- **`event_type`**  
  An enumeration that can have one of the following values:
    - `EventType.OPPOSITION`
    - `EventType.CONJUNCTION`
    - `EventType.OCCULTATION`
    - `EventType.MAXIMAL_ELONGATION`
    - `EventType.MOON_PERIGEE`
    - `EventType.MOON_APOGEE`
- **`objects`**  
  A list of [`Object`](#object)s that take place in the event.
- **`start_time`**  
  The `datetime` at which the event starts.
- **`end_time`**  
  The `datetime` at which the event ends.  
  If `None`, then the event is punctual and has no duration.

  Note that this field is currently always `None`, it has been reserved for the future.
- **`details`**  
  A string with some details about the event. Can be `None`.

#### Methods

### `Object`

An astronomical object.

#### Fields

- **`idendifier`**  
  An enumeration that can have one of the following values:
    - `ObjectIdentifier.SUN`
    - `ObjectIdentifier.EARTH`
    - `ObjectIdentifier.MOON`
    - `ObjectIdentifier.MERCURY`
    - `ObjectIdentifier.VENUS`
    - `ObjectIdentifier.MARS`
    - `ObjectIdentifier.JUPITER`
    - `ObjectIdentifier.SATURN`
    - `ObjectIdentifier.URANUS`
    - `ObjectIdentifier.NEPTUNE`
    - `ObjectIdentifier.PLUTO`
- **`radius`**
  The radius of the object in kilometers.

#### Methods

- **`get_type()`**  
  An enumeration of the possible types of the object. Can have one of the following possible values:
    - `ObjectType.STAR`
    - `ObjectType.PLANET`
    - `ObjectType.DWARF_PLANET` 
    - `ObjectType.SATELLITE`

### `MoonPhase`

#### Fields

- **`phase_type`**  
    An enumeration that can have one of the following values:
    - `MoonPhaseType.NEW_MOON`
    - `MoonPhaseType.WAXING_CRESCENT`
    - `MoonPhaseType.FIRST_QUARTER`
    - `MoonPhaseType.WAXING_GIBBOUS`
    - `MoonPhaseType.FULL_MOON`
    - `MoonPhaseType.WANING_GIBBOUS`
    - `MoonPhaseType.LAST_QUARTER`
    - `MoonPhaseType.WANING_CRESCENT`
- **`time`**  
    A `datetime` that indicates when the phase will happen.  
    Only set for the following `phase_types`:
    - `NEW_MOON`
    - `FIRST_QUARTER`
    - `FULL_MOON`
    - `LAST_QUARTER`
- **`next_phase_date`**  
    The `datetime` of when the following phase date will happen.

#### Methods
- `get_next_phase()`  
    Returns the moon phase that will follow the one represented by the object.  
    Possible values are the same as the `phase_type` field.
- `serialize()`  
    Converts the object to a dictionnary.

### `Position`

The user's coordinates. This object is used for the [ephemerides calculations](#get-the-ephemerides).

#### Fields

- **`latitude`**  
  A `float` for the latitude
- **`longitude`**  
  A `float` for the longitude
