# Metrics and Measurement

## Core Web Vitals

Current Core Web Vitals should be verified against official documentation when exact behavior matters.

The current primary set is:

- LCP
- INP
- CLS

## LCP

Represents perceived loading of major page content.

Investigate the actual LCP element.

## INP

Represents interaction responsiveness across user interactions.

Investigate main-thread work and rendering associated with slow interactions.

## CLS

Represents unexpected visual movement.

Reserve layout space and avoid unstable insertion.

## Lab Tools

Examples may include:

- Lighthouse
- browser performance tooling
- local profiling

## Field Data

Examples may include:

- real-user monitoring
- CrUX-backed tools
- production telemetry

## Principle

Metrics guide investigation.

Do not optimize the score while making the actual product worse.
