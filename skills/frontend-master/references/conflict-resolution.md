# Frontend Skill Conflict Resolution

Use this reference when multiple skills appear to own the same work.

## creative-direction vs interface-polish

Use creative-direction when:

the visual concept is weak or missing

Use interface-polish when:

the concept is already correct but execution feels unfinished

## creative-direction vs visual-reference-to-code

Use visual-reference-to-code when:

the supplied reference is the target

Use creative-direction when:

the reference is only inspiration and a new direction must be created

## creative-direction vs redesign-existing-projects

Use redesign-existing-projects first for an existing product.

Add creative-direction only when the audit shows that the visual direction itself needs substantial change.

## design-system-web vs extract-design-system

Use extract-design-system to discover or document a system.

Use design-system-web to create, normalize, extend, or implement the reusable system.

They may be sequential.

## frontend-architecture vs frontend-ui-engineering

Use frontend-architecture to decide:

where things belong

Use frontend-ui-engineering to:

implement them

Small implementation changes may not need architecture work.

## responsive-composition vs frontend-ui-engineering

Use responsive-composition for meaningful cross-viewport design decisions.

Use frontend-ui-engineering for ordinary responsive implementation once the behavior is known.

## interface-polish vs advanced-motion

Use interface-polish for:

hover
press
small state motion
minor transition refinement

Use advanced-motion for:

timelines
scroll choreography
pinning
macro sequencing

## advanced-motion vs web-3d

Use advanced-motion for DOM and page choreography.

Use web-3d for real-time WebGL scene rendering.

A project may use both, but only when both have distinct responsibilities.

## asset-direction vs web-3d

Use asset-direction to decide:

what visual medium and assets are needed

Use web-3d to implement:

real-time spatial rendering

## frontend-performance vs domain specialists

frontend-performance diagnoses and coordinates performance.

The domain specialist fixes domain-specific causes.

Examples:

GSAP:
advanced-motion

WebGL:
web-3d

image strategy:
asset-direction

rendering architecture:
frontend-architecture

## frontend-accessibility vs frontend-ui-engineering

frontend-ui-engineering maintains baseline accessible implementation.

frontend-accessibility owns deeper auditing, remediation, and standards-oriented review.

## visual-qa vs visual-reference-to-code

visual-reference-to-code implements toward a visual target.

visual-qa evaluates the actual rendered result.

They are complementary.

## frontend-resource-intelligence vs all specialists

frontend-resource-intelligence chooses external resources.

It does not replace the specialist that understands the actual design or engineering problem.

## General Rule

When uncertain:

choose the skill that owns the requested outcome

then add only specialists that own a material constraint.
