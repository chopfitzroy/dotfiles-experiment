# AI

How engineers feel about AI is varied, some are [strongly against](https://unixdigest.com/articles/if-youre-a-programmer-and-you-feel-depressed-by-ai-dont-be.html) while others are convinced it [changes everything](https://burkeholland.github.io/posts/opus-4-5-change-everything/).

I personally have experienced both [AI ambivalence](https://nolanlawson.com/2025/04/02/ai-ambivalence/) and the [programmer identity crisis](https://hojberg.xyz/the-programmer-identity-crisis/) and I'm happy to say I have found a middle ground that I am happy with.

### What code means to us

Up until recently _hand written_ code was the only way to create software of meaningful complexity and as a result we all did it, now we obviously had different tastes object orientated versus functional, tabs versus spaces, etc... but at the end of the day because we couldn't build software _without_ code we didn't really talk about why we write code.

For some engineers code is a means to an end, it was a necessary evil in the transition from ideation to reality and if it hadn't needed to be done they wouldn't have done it. For other engineers the code was the part they genuinely looked forward to and they saw everything up until that point as a chore before they got to do what they enjoyed most.

For the longest time none of this mattered because there _wasn't_ an alternative, and now that there is we're seeing a divide like never before and from my perspective **no one is wrong** and we shouldn't be trying to convince whichever side we're not on to change their mind.

This [Reddit thread](https://www.reddit.com/r/ClaudeAI/comments/1q5lt9g/developer_uses_claude_code_and_has_an_existential/) has some great conversations highlighting some of the complex feelings we are seeing right now, one comment in their summed up my exact feelings that I have been struggling to articulate for some time.

### The trade we make

I think we spend way too much time and energy talking about whether or not AI _is_ useful, and honestly at this point I think it's hard to deny that it definitely has _some_ use to what degree that exists is absolutely up for debate and not somehting I'm intrested in exploring here.

I think what we should be talking instead is the **explicit trade off** we make when we use AI and that is that we trade an _increase in speed_ for a _decrease in understanding_. Now I am sure there are people out there who will disagree with me or claim that they've discovered the ultimate workflow that allows their understanding of the codebase to remain intact despite not writing any code.

If that's true that's fantastic and I can't wait until workflows like that become more mainstream, but as it stands I fundamentally believe that the only way to gain an intimate understanding of the code is to write it yourself.

Now none of that is to say we shouldn't make that trade, instead I want to discuss _when_ we might want to make that trade, and this I think is where the discourse starts to fall apart _because_ this is going to be different for everyone.

From my perspective AI writes incredible server side code from API routes to database schema / queries (using [Convex](https://www.convex.dev/)) specifically. This code is easy to review, simple to spot any prevelant code smells and honestly very close to what I would write by hand. As a result the trade off here is relatively low risk.

Where I still think that AI struggles is with UI code, now before I continue I want to make it very clear that AI _can_ write UI code it's just not the UI code I want. I've spent years working with UI and as a result have developed something of a sixth sense for when something is going in the wrong direction, excessive need for defensive code, hard to follow component boundaries, etc... Additionally because AI has a tendency to spit out so much UI code so quickly it becomes a considerable mental burden to review.

### Reclaiming my joy

So how did I find a place where I feel I am getting the advantages of AI without having to say goodbye to one of my favourite parts of engineering (writing code)?

The short answer is I do both. I use Claude Code extensively to plan out the server work for new features, I use [React Router](https://reactrouter.com/) currently which means it is usually responsible for writing the `loader` and `action` functions as well as any [resource routes](https://reactrouter.com/how-to/resource-routes) and the [Convex](https://www.convex.dev/) queries and mutations.

I handle the UI implementation after it's complete (and while it's working on the next thing). I find UI relatively easy these days and immensely enjoyable. I find this is the perfect mix of keeping me close enough to the project to still feel like I have a deep understanding yet still beneficial in the sense that I am moving faster than I was previously. I also end up with UI code I am **much** happier with as a result.

There are also technical reasons I think this works, it's much easier for agentic tools like Claude Code to test [Convex](https://www.convex.dev/) queries and mutations or to hit an API endpoint and confirm it is returning the correct data. Also I very rarely have designs to work from (especially on side projects) so a big part of the UI piece is _playing_ with the look and feel until I am happy.

### The nitty gritty

I run a relatively vanilla Claude Code setup which I've detailed below. For anyone looking to improve how they work with Claude I highly recommend the following links:

- https://x.com/i/status/2007179832300581177
  - https://www.youtube.com/watch?v=JUTx6MxOjhE
  - https://www.reddit.com/r/ClaudeAI/comments/1q2c0ne/claude_code_creator_boris_shares_his_setup_with/
- https://github.com/ChrisWiles/claude-code-showcase
- https://www.humanlayer.dev/blog/writing-a-good-claude-md
- https://claude.com/blog/organization-skills-and-directory

As far as my workflow goes it looks something like:

- Checkout a new branch
- Enter [planning mode](https://code.claude.com/docs/en/common-workflows#use-plan-mode-for-safe-code-analysis) using `opusplan` model
- Once the plan is finalized run the plan and accept edits
- Open another terminal tab and fire up [`lazygit`](https://github.com/jesseduffield/lazygit)
- Open up another tab and `npm run dev` (or whatever the equivalent is) to run project

It's worth I don't use `--dangerously-skip-permissions` but I do leverage [sandboxing](https://code.claude.com/docs/en/sandboxing) to limit the amount of babysitting I need to provide once Claude and I have agreed on the plan.

### Resources

Here are some links that don't fit into the above content but that I have still found immensely useful

- https://antirez.com/news/158
- https://blog.val.town/vibe-code
- https://steipete.me/posts/just-talk-to-it
- https://paddy.carvers.com/posts/2025/07/ai
- https://www.humanlayer.dev/blog/brief-history-of-ralph
- https://rselbach.com/your-sub-is-now-my-weekend-project/
- https://buttondown.com/apperceptive/archive/ai-is-bad-ux
- https://joshmock.com/post/2026-agents-md-as-a-dark-signal/
- https://dylanbeattie.net/2025/04/11/the-problem-with-vibe-coding.html
- https://thomasorus.com/i-tried-coding-with-ai-i-became-lazy-and-stupid
- https://blog.glyph.im/2025/06/i-think-im-done-thinking-about-genai-for-now.html

Also I've started to see people suggest that their is such a thing as [AI optimized code](https://burkeholland.github.io/posts/opus-4-5-change-everything/) I think this **utter bullshit** and that the same heuristics that make code easy to digest for humans also applies to LLM's.
