# Token Inference

Do not turn every observed value into a token.

## Good Token Candidates

Values that are:

- repeated
- meaningful
- theme-sensitive
- used across components
- likely to change together

## One-Off Values

Keep art-directed one-off values local when they do not represent a system rule.

## Semantic Naming

Name by purpose when the role is clear.

Example:

surface-muted

rather than:

gray-200

for component consumption.

## Confidence

Explicit:
defined directly in source

Strong:
repeated clearly across many locations

Inferred:
likely based on visual pattern

Uncertain:
insufficient evidence

## Principle

A smaller accurate token system is better than a large guessed one.
