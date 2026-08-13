# Integration With Existing HalalFrFr Frontend Skills

The full-stack package expects the existing frontend package to stay installed.

## Full-stack owns
Product/full-stack routing, approval, contracts, backend/data coordination, auth/error semantics, and cross-layer QA.

## Frontend package owns
Frontend routing through `frontend-master`, creative direction, frontend architecture/UI engineering, design systems, responsiveness, motion/3D, accessibility/performance, and visual QA.

## Ground-up frontend rebuild
The full-stack layer first protects APIs/actions, auth behavior, contracts, business behavior, and integrations. Then `frontend-master` may rebuild presentation code without preserving poor old UI architecture.
