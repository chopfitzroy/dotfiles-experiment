# Working with AI

It's taken me a long time to come to terms with AI assisted coding and how I feel about it. I've gone all the way from [AI ambivalence](https://nolanlawson.com/2025/04/02/ai-ambivalence/) to experiencing the [programmer identity crisis](https://hojberg.xyz/the-programmer-identity-crisis/) with many stops inbetween. I am now in a position where I have found value in these tools and want to write a little bit about how I use them and my thoughts about them moving forward.

### How I use AI

The way _I like to use AI_ is as a tool for prototyping out ideas or concepts quickly. My current workflow looks something like this:

- Checkout a new branch
- Boot up [`codex`](https://github.com/openai/codex) and start giving it directions
- Open another terminal tab and fire up [`lazygit`](https://github.com/jesseduffield/lazygit)
- Open up another tab and `npm run dev` (or whatever the equivalent is)

Once the AI is done I'll checkout the changes, I'll think about what I do like and what I don't like and iterate. Once I have confirmed I am happy with the basic functionality I move from the `codex` tab to the `lazygit` tab. I go through _every single file, line by line_ in most cases I press `e` to drop straight into [`hx`](https://helix-editor.com/) and start editing anything that _I consider janky_.

I **DO NOT** try to refine my prompt further or use english language to instruct my AI on how to fine tune the code, I do this myself because it's _absolutely_ faster and lets me gain familarity with the code I would otherwise miss out on.

Most files get a touch up, anything that's UI heavy often get's a **LOT** of touch up, by the time I'm finished I am confident that final output is roughly equivalent to what I would have written by hand - which is _to me_ the best possible outcome.

My preference when using AI is to [just talk to it](https://steipete.me/posts/just-talk-to-it) and make small focused changes instead of trying to one shot an entire product with pages upon pages of detailed specs that become too overwhelming for me to realistically review.

If the intial prototype feels like shit I will stop right there reset the branch and go back to the drawing board. This is the _real value proposition_, being able to get a feel for a feature _before_ I spend hours implementing it. It's not that AI saves me a lot of time (honestly it's probably net neutral) it's that it let's me abandon the wrong approach _much_ earlier in the process.

Once I am happy with the code I will open up a pull request and hand it over to other humans to review, remembering [your vibe coded slop PR is not welcome](https://samsaffron.com/archive/2025/10/27/your-vibe-coded-slop-pr-is-not-welcome) so by this point the code is at the same quality level as if I hand written it entirely by hand.

If there is a feature or a piece of code I want to work on and I'm not sure what it should look like and I want to _play with it_ as part of the discovery process then I absolutely will do this, one of the most dangerous things about AI _in my opinion_ is this idea that if we're not using it we're not being as productive as humanly possible, first of all who gives a shit? Second of all sometimes writing (or playing with) the code _is_ part of the process in unlocking our understanding. Don't be scared to [write the damn code](https://antonz.org/write-code/).

Finally I think it's really important to _give yourself permission_ to write the code you want to write. Coding is fun and for a lot of us can be carthartic just because AI _might_ (and it's a big _might_) write it faster doesn't mean there isn't value in your writing it, even if it's only because you want to. And I can promise you in almost all instances your going to end up with better code and a better understanding of the problem when you do it yourself which are metrics you should be considering along side the time it takes to actually write the code.

### The discourse

As far as I am concerned AI is massively over-hyped and the discourse around it can be exhausting[[1](https://paddy.carvers.com/posts/2025/07/ai/)][[2](https://blog.glyph.im/2025/06/i-think-im-done-thinking-about-genai-for-now.html)] not to mention there have been a number of individuals (including myself) who have said outright that AI takes the joy out of programming[[1](https://alexn.org/blog/2025/10/27/ai-sucks-the-joy-out-of-programming/)][[2](https://news.ycombinator.com/item?id=45572130)] some even going as far as to say [I tried coding with AI, I became lazy and stupid](https://thomasorus.com/i-tried-coding-with-ai-i-became-lazy-and-stupid).

Of course there are others who find the inverse to be true, studies like [getting AI to work in complex codebases](https://github.com/humanlayer/advanced-context-engineering-for-coding-agents/blob/main/ace-fca.md) or posts like _AI is already writing [90%](https://lucumr.pocoo.org/2025/9/29/90-percent/) of the code_. Both of which I find very interesting and while they don't align with my lived experience I am following stories like this with interest from the sidelines.

From my perspective these tools add value _but_ that value is _early_ in the process giving engineers the ability to explore possibilities much faster than they have been able to previously. As far as production code goes [the problem with "vibe coding"](https://dylanbeattie.net/2025/04/11/the-problem-with-vibe-coding.html) is essentially that all [vibe code is legacy code](https://blog.val.town/vibe-code) and in my opinion has no place in a production code base.

### Final thoughts

The way I see it AI lets developers trade faster intial speeds for a loss in long term understanding and familiarity. With that in mind that doesn't automatically mean AI is the wrong choice but instead it means that we should be applying in the right scenarios - namely when we want to test a theory or concept without investing more of our precious time than we need to. However once we have validated our idea and know it is something we want to iterate on long term at that point I think AI becomes significantly less valuable.

I do also wonder if we are seeing a growing divide in what I am going to call the _archetypes_ of engineering. The way I see it engineers typically fall into two groups those who code as a means to an end and those who consider code their _craft_. Up until recently we've been able to peacefully coexist as while we may have had different mindsets we ultimately were all working towards a common goal.

AI creates friction because it is far more useful to one end of the spectrum than the other, if code quality has never been your primary focus and you are more interested in results AI is almost entirely a net positive. If you consider code an art form and can't tolerate the _quality_ of code produced by LLM's it makes their use far more limited.

I truly believe that LLM's are designed to be easy to use for _everyone_ and despite what some people may think I don't really believe that their is the perfect prompt or strategy to 10x an LLM's output. Are there things you can do to get better results? Sure! But I liken it more to something like being able to use Google effectively, are people who use Google effectively getting better results? Yes of course, but are they getting results so much better that it makes Google useless for everyone else? No absolutely not!

All of that to say when we talk about some people having a _much better experience_ with LLM's I don't actually think this is the case. I think we are all having _roughly_ the same experience it's just that to some of us it feels a lot more valuable. Neither party is right or wong in this scenario either, it's just about what each individual considers valuable to them.

I do think [the AI coding trap](https://chrisloy.dev/post/2025/09/28/the-ai-coding-trap) is real and that if your not deliberate about how you use these tools you can easily fall victim to [the perverse incentives of vibe coding](https://uxdesign.cc/the-perverse-incentives-of-vibe-coding-23efbaf75aee). It's easy to feel overwhelmed by the seemingly endless news coming out of this space but if you are feeling like this try remember that [no, AI is not making engineers 10x as productive](https://colton.dev/blog/curing-your-ai-10x-engineer-imposter-syndrome/) and your not _falling behind_ if you don't feel like your getting the value out of these things that other people say they are.
