# Working with AI

It's taken me a long time to come to terms with AI assisted coding and how I feel about it, you could say I've been experience the [programmer identity crisis](https://hojberg.xyz/the-programmer-identity-crisis/) and you'd be right.

### What I like

The way _I like to use AI_ is as a tool for prototyping out idea's, my workflow looks something like this:

- Checkout a new branch
- Boot up [`codex`](https://github.com/openai/codex) and start giving it directions
- Open another terminal tab and fire up [`lazygit`](https://github.com/jesseduffield/lazygit)
- Open up another tab and `npm run dev` (or whatever the equivalent is)

Once the AI is done I'll checkout the changes, I'll think about what I do like and what I don't like and iterate. Once the solution is about 90% there from a functionality perspective I move from my `codex` tab to my `lazygit` tab, I go through _every single file line by line_ in most cases I press `e` to be dropped straight into [`hx`](https://helix-editor.com/) and start editing the anything that _I consider janky_. 

Most files get a touch up, anything that's UI heavy often get's a **LOT** of touch up, by the time I'm finished I am confident that final output is roughly equivalent to what I would have written by hand - which is _to me_ the best possible outcome.

If the task is particularily complex I might back and fourth with the agent before getting it to write a plan, if it's a small surgical update I will normally forgoe this step. My preference is to [just talk to it](https://steipete.me/posts/just-talk-to-it) and make small focused changes instead of trying to one shot an entire product with pages upon pages of detailed specs that become too overwhelming for me to realistically review.

If the intial prototype feels like shit I will stop right there reset the branch and go back to the drawing board. This is the _real value proposition_, being able to get a feel for a feature _before_ I spend hours implementing it. It's not that AI saves me a lot of time (honestly it's probably roughly the same) it's that it let's me abandon the wrong approach _much_ earlier in the process.

Once I am happy with the code I will open up a pull request and hand it over to other humans to review, remember [Your vibe coded slop PR is not welcome](https://samsaffron.com/archive/2025/10/27/your-vibe-coded-slop-pr-is-not-welcome) so by this point the code is at the same quality level as if I hand written it entirely by hand.

**NOTE:** If there is a feature or a piece of code I want to work on and I'm not sure what it should look like and I want to _play with it_ to help me figure it out then I absolutely will do this, one of the most dangerous things about AI _in my opinion_ is this idea that if we're not using it we're not being as productive as humanly possible, first of all who gives a shit? Second of all sometimes writing (or playing with) the code _is_ part of the process in unlocking our understanding. Don't be scared to [write the damn code](https://antonz.org/write-code/).


### What I don't like

As far as I am concerned AI is massively over-hyped and the discourse around it can be exhausting[[1](https://paddy.carvers.com/posts/2025/07/ai/)][[2](https://blog.glyph.im/2025/06/i-think-im-done-thinking-about-genai-for-now.html)] not to mention there have been a number of individuals (including myself) who has said that AI takes the joy out of programming[[1](https://colton.dev/blog/curing-your-ai-10x-engineer-imposter-syndrome/)][[2](https://news.ycombinator.com/item?id=45572130)] some even going as far as to say [I tried coding with AI, I became lazy and stupid](https://thomasorus.com/i-tried-coding-with-ai-i-became-lazy-and-stupid).

There is of course another side to this coin studies like [Getting AI to Work in Complex Codebases](https://github.com/humanlayer/advanced-context-engineering-for-coding-agents/blob/main/ace-fca.md) or successful individuals who are using AI to write [90%](https://lucumr.pocoo.org/2025/9/29/90-percent/) of the code. Both of which I find very interesting and while they don't align with my lived experience I am following stories like this with interest from the sidelines.

From my perspective these tools add value but in my own experience at least the value proposition is _early_ in the process giving engineers the ability to explore possibilities much faster than they have been able to previously. As far as production code goes [The Problem with “Vibe Coding”](https://dylanbeattie.net/2025/04/11/the-problem-with-vibe-coding.html) remains [Vibe code is legacy code](https://blog.val.town/vibe-code) and has no place in a production codebase.

### Looking forward

I plan to keep leveraging this tools while they remain cost effective, I am cognizant that I don't want to fall into [The AI coding trap](https://chrisloy.dev/post/2025/09/28/the-ai-coding-trap) and don't consider these tools a _speed multiplier_ as such but more of a way to _fail fast_ and _iterate rapidly_ during the early conception of new features / ideas.

Previously I have definitely experienced [AI ambivalence](https://nolanlawson.com/2025/04/02/ai-ambivalence/) and felt that AI would _take away_ from the joy that is programming, now I've found a nice middle ground that effectively [nerd snipes](https://www.explainxkcd.com/wiki/index.php/356:_Nerd_Sniping) me into cleaning up after the AI but in a way that I actually find enjoyable.

Whenever I do experience self dount I try to remind myself of [The perverse incentives of Vibe Coding](https://uxdesign.cc/the-perverse-incentives-of-vibe-coding-23efbaf75aee), and that [No, AI is not Making Engineers 10x as Productive](https://colton.dev/blog/curing-your-ai-10x-engineer-imposter-syndrome/) but the marketing around AI is _absolutely_ designed to make you think so.
