# CLAUDE.md - Instructions for Claude Code

This file provides global guidance for Claude Code sessions across projects.

## Self-Improvement

After every correction or mistake, update the appropriate CLAUDE.md file with a rule to prevent repeating it. Claude is good at writing rules for itself.

End corrections with: "Now update CLAUDE.md so you don't make that mistake again." If the current working directory contains a CLAUDE.md file, update it. Otherwise, prompt for creation.

If a correction or mistake is generalized and could be considered a global rule for all projects, update the global CLAUDE.md file instead.

Keep iterating until the mistake rate measurably drops.

## Working with Plan Mode

- Start every complex task in plan mode (shift+tab to cycle)
- Pour energy into the plan so Claude can 1-shot the implementation
- When something goes sideways, switch back to plan mode and re-plan. Don't keep pushing. Use ralph-loop plugin to iterate on the plan.
- Use plan mode for verification steps too, not just for the build
- Leverage the superpowers plugin by default

## Parallel Work

- For tasks that need more compute, use subagents to work in parallel
- Offload individual tasks to subagents to keep the main context window clean and focused
- When working in parallel, only one agent should edit a given file at a time
- For fully parallel workstreams, use git worktrees:
  `git worktree add .claude/worktrees/<name> origin/main`

## Automation

- Use `/loop` to run a skill on a recurring interval (e.g., `/loop 5m /babysit`)
- Use `/schedule` to schedule Claude to run on a cron-based schedule, up to a week
- Turn repetitive workflows into skills, then loop them for hands-free automation

## Session Management

- Use `/branch` to fork a session, or `claude --resume <session-id> --fork-session` from CLI
- Use `/btw` for side queries without interrupting the agent's current work
- Use `/teleport` to continue a cloud session on your local machine
- Use `/remote-control` to control a local session from your phone or browser
- Use `/voice` (CLI) or the voice button (Desktop) for voice input

## Things Claude Should NOT Do

<!-- Add mistakes Claude makes so it learns -->

- Don't use `any` type in TypeScript without explicit approval
- Don't skip error handling
- Ask the user to make commits, or ask for permission to make basic commits
- Don't make breaking API changes without discussion
- Check accessibility compliance for frontend work before considering it done
