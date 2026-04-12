FROM opensuse/tumbleweed

# ── 1. Zypper packages (single layer) ────────────────────────────────────────
RUN zypper refresh && \
    zypper install -y --no-recommends \
        fd \
        ripgrep \
        jq \
        yq \
        zsh \
        helix \
        helix-runtime \
        rsync \
        starship \
        difftastic \
        git \
        stow \
        gcc \
        unzip \
        curl \
        tar \
        gzip \
        libicu-devel \
    && zypper clean --all

# ── 2. Helix symlinks ────────────────────────────────────────────────────────
RUN mkdir -p /usr/local/bin && \
    ln -sf /usr/bin/helix /usr/local/bin/hx && \
    ln -sf /usr/local/bin/hx /usr/local/bin/helix

# ── 3. Lazygit (GitHub release) ──────────────────────────────────────────────
ARG LAZYGIT_VERSION=0.44.1
RUN curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
    | tar xz -C /usr/local/bin lazygit

# ── 4. Sheldon (crate.sh installer) ──────────────────────────────────────────
RUN curl -fsSL https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --force --repo rossmacarthur/sheldon --to /usr/local/bin

# ── 5. Marksman — Markdown LSP (GitHub release) ──────────────────────────────
ARG MARKSMAN_VERSION=2024-12-18
RUN curl -fsSL -o /usr/local/bin/marksman \
    "https://github.com/artempyanykh/marksman/releases/download/${MARKSMAN_VERSION}/marksman-linux-x64" && \
    chmod +x /usr/local/bin/marksman

# ── 6. fnm + Node.js ─────────────────────────────────────────────────────────
ARG NODE_VERSION=25.9.0
RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell && \
    export PATH="/root/.local/share/fnm:${PATH}" && \
    eval "$(fnm env)" && \
    fnm install ${NODE_VERSION} && \
    fnm default ${NODE_VERSION}
ENV PATH="/root/.local/share/fnm/aliases/default/bin:/root/.local/share/fnm:${PATH}"

# ── 7. npm global packages (LSPs + pi) ───────────────────────────────────────
RUN npm install -g \
    vscode-langservers-extracted \
    typescript-language-server \
    @mariozechner/pi-coding-agent

# ── 8. Zsh completions ───────────────────────────────────────────────────────
ENV ZSH_COMPLETIONS=/etc/zsh_completions
RUN mkdir -p ${ZSH_COMPLETIONS} && \
    fd --gen-completions zsh > ${ZSH_COMPLETIONS}/_fd && \
    rg --generate complete-zsh > ${ZSH_COMPLETIONS}/_rg && \
    yq completion zsh > ${ZSH_COMPLETIONS}/_yq && \
    starship completions zsh > ${ZSH_COMPLETIONS}/_starship && \
    sheldon completions --shell zsh > ${ZSH_COMPLETIONS}/_sheldon

# ── 9. Default shell ─────────────────────────────────────────────────────────
RUN chsh -s /usr/bin/zsh root
SHELL ["/usr/bin/zsh", "-c"]
CMD ["zsh"]
