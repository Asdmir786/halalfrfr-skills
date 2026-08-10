# Frontend Workflow Recipes

These recipes are starting points, not mandatory bundles.

## New Marketing Page

Typical:

creative-direction
frontend-ui-engineering
responsive-composition

Add design-system-web when reusable visual rules need establishing.

Add asset-direction when media determines the concept.

Add advanced-motion when macro motion is central.

Add web-3d only when spatial rendering is justified.

Finish substantial visual work with visual-qa when possible.

## New SaaS or Product Surface

Typical:

frontend-architecture
frontend-ui-engineering
responsive-composition

Add design-system-web when the product system needs creation or extension.

Add creative-direction when visual direction is not established.

Add shadcn-integration if the project uses shadcn.

Add frontend-accessibility for deeper interaction review.

## Small Existing UI Change

Typical:

frontend-ui-engineering

Add interface-polish when the request is primarily visual refinement.

Do not invoke creative-direction automatically.

## Make This UI Better

Inspect first.

If concept is weak:
creative-direction

If structure is weak:
frontend-architecture

If responsive behavior is weak:
responsive-composition

If details are weak:
interface-polish

If the whole existing surface needs modernization:
redesign-existing-projects

## Screenshot to Code

Typical:

visual-reference-to-code
frontend-ui-engineering
responsive-composition
visual-qa

Do not automatically add creative-direction.

## Existing Product Redesign

Start:

redesign-existing-projects

Then select only findings-driven support.

Possible support:

creative-direction
design-system-web
frontend-architecture
asset-direction
responsive-composition
interface-polish

## Design System Extraction

Start:

extract-design-system

If implementing the result:

design-system-web

If applying it to code:

frontend-ui-engineering

## shadcn Existing Project

Start:

shadcn-integration

Implementation:

frontend-ui-engineering

Design-system changes:

design-system-web

## Advanced Landing Page Motion

Start with the page's design workflow.

Add:

advanced-motion

only once motion has a meaningful narrative or interaction role.

Add frontend-performance when motion is substantial.

## 3D Product Page

Start with:

creative-direction
asset-direction

If real-time interaction is justified:

web-3d

Also consider:

frontend-architecture
frontend-ui-engineering
responsive-composition
frontend-performance
visual-qa

Do not choose real-time 3D when rendered media achieves the same goal more effectively.

## Accessibility Remediation

Start:

frontend-accessibility

Add:

frontend-ui-engineering

when implementation changes are required.

Add shadcn-integration when affected controls use shadcn.

## Performance Investigation

Start:

frontend-performance

Then route to the bottleneck owner.

Examples:

animation:
advanced-motion

3D:
web-3d

architecture:
frontend-architecture

assets:
asset-direction

## Final Polish Pass

Use:

interface-polish

Then:

visual-qa

when rendered inspection is available and the change is visually meaningful.
