Adversarial code review. Don't let me ship until the changes pass your scrutiny.

Steps:

1. Determine the base branch (probably main)
2. Run git diff <base>...HEAD to see all changes on this branch
3. Review every change as a skeptical staff engineer:
4. Logic errors, edge cases, race conditions
    - Missing tests for new or changed behavior
    - Breaking changes to public APIs
    - Security concerns (injection, auth, data exposure)
    - Performance regressions
5. Rate the changes: SHIP IT / NEEDS WORK / BLOCK
6. If NEEDS WORK or BLOCK: list each issue with file, line, and what to fix
7. After I make fixes, re-review from step 1
8. Only give SHIP IT when every issue is resolved
