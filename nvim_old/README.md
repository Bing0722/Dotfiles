# Nvim Configuration

> [!NOTE]
> This Neovim setup is sufficient for my daily programming and learning, and I will continue to improve it in the future.

## Keymap

this is always using keymaps.

### General

| Key        | Description               | Mode       |
|------------|---------------------------|------------|
| `<C-h>`      | Go to Left Window         | n, x       |
| `<C-l>`      | Go to Right Window        | n, x       |
| `<C-j>`      | Go to Down Window         | n, x       |
| `<C-k>`      | Go to Up Window           | n, x       |
| `<leader>bd` | Delete Buffers            | n          |
| `<leader>bo` | Delete Other Buffers      | n          |
| `<esc>`      | Escape and Clear hlsearch | i, n       |
| `n`          | Next Search Result        | n, x, o    |
| `N`          | Prev Search Result        | n, x, o    |
| `<C-s>`      | Save File                 | i, x, n, s |
| `<leader>l`  | Lazy                      | n          |
| `<leader>xq` | Quickfix List             | n          |
| `<leader>cf` | Format                    | n, v       |
| `<leader>-`  | Split Window Below        | n          |
| `<leader>wd` | Delete Window             | n          |
| `<leader>wm` | Toggle Maximize           | n          |

### LSP

| Key        | Description            | Mode |
|------------|------------------------|------|
| `gd`         | Goto Definition        | n    |
| `gr`         | References             | n    |
| `gI`         | Goto Implementation    | n    |
| `gy`         | Goto T[y]pe Definition | n    |
| `gD`         | Goto Declaration       | n    |
| `K`          | Hover                  | n    |
| `gK`         | Signature Help         | n    |
| `<c-k>`      | Signature Help         | i    |
| `<leader>ca` | Code Action            | n, v |
| `<leader>cc` | Run Codelens           | n, v |
| `<leader>cR` | Rename File            | n    |
| `<leader>cr` | Rename                 | n    |
| `<leader>cA` | Source Action          | n    |
| `]]`         | Next Reference         | n    |
| `[[`         | Prev Reference         | n    |
| `<a-n>`      | Next Reference         | n    |
| `<a-p>`      | Prev Reference         | n    |

### Buffer

| Key   | Description | Mode |
|-------|-------------|------|
| `<S-h>` | Prev Buffer | n    |
| `<S-l>` | Next Buffer | n    |

### Flash

| Key | Description  | Mode |
|-----|--------------|------|
| `r`   | Remote Flash | o    |

### Neo-tree

| Key        | Description                 | Mode |
|------------|-----------------------------|------|
| `<leader>be` | Buffer Explorer             | n    |
| `<leader>e`  | Explorer NeoTree (Root Dir) | n    |
| `<leader>E`  | Explorer NeoTree (cwd)      | n    |
| `<leader>fe` | Explorer NeoTree (Root Dir) | n    |
| `<leader>fE` | Explorer NeoTree (cwd)      | n    |
| `<leader>ge` | Git Explorer                | n    |

### Telescope

| Key             | Description           | Mode |
|-----------------|-----------------------|------|
| `<leader><space>` | Find Files (Root Dir) | n    |
| `<leader>/`       | Grep (Root Dir)       | n    |
| `<leader>fr`      | Recent                | n    |

### Todo-comments

| Key        | Description              | Mode |
|------------|--------------------------|------|
| `<leader>st` | Todo List                | n    |
| `<leader>sT` | Todo/Fix/Fixme           | n    |
| `<leader>xt` | Todo (Trouble)           | n    |
| `<leader>xT` | Todo/Fix/Fixme (Trouble) | n    |
| `[t`         | Previous Todo Comment    | n    |
| `]t`         | Next Todo Comment        | n    |

### Surround

| Key | Description        | Mode |
|-----|--------------------|------|
| `gsa` | Add Surrounding    | n, v |
| `gsd` | Delete Surrounding | n    |

### Neogen

| Key        | Description                   | Mode |
|------------|-------------------------------|------|
| `<leader>cn` | Generate Annotations (Neogen) | n    |

### Outline

| Key        | Description    | Mode |
|------------|----------------|------|
| `<leader>cs` | Toggle Outline | n    |

### Markdown-preview

| Key        | Description      | Mode |
|------------|------------------|------|
| `<leader>cp` | Markdown Preview | n    |

### Kalala

| Key        | Description              | Mode |
|------------|--------------------------|------|
| `<leader>R`  | +Rest                    | n    |
| `<leader>Rb` | Open scratchpad          | n    |
| `<leader>Rc` | Copy as cURL             | n    |
| `<leader>RC` | Paste from curl          | n    |
| `<leader>Rg` | Download GraphQL schema  | n    |
| `<leader>Ri` | Inspect current request  | n    |
| `<leader>Rn` | Jump to next request     | n    |
| `<leader>Rp` | Jump to previous request | n    |
| `<leader>Rq` | Close window             | n    |
| `<leader>Rr` | Replay the last request  | n    |
| `<leader>Rs` | Send the request         | n    |
| `<leader>RS` | Show stats               | n    |
| `<leader>Rt` | Toggle headers/body      | n    |

### Other

| Key          | Description            | Mode |
|--------------|------------------------|------|
| `<F1>`         | Help                   | n    |
| `<F4>`         | Typroa open markdown   | n    |
| `<F5>`         | Run simple code/script | n    |
| `<F7>`         | Open Yazi              | n    |
| `<F8>`         | Open Yazi(cwd)         | n    |
| `<F9>`         | Open float terminal    | n    |
| `<F10>`        | Open right terminal    | n    |
| `<F11>`        | Open bottom terminal   | n    |
| `<F12>`        | Open git terminal      | n    |
| `<leader><CR>` | SnipRun                | n    |
| `gcc`          | Comment                | v    |

------

I've referenced some of the Markdown configurations from [Kicamon](https://github.com/Kicamon/nvim.git)

> [!Note]
> My nvim Configuration is based on 💤 [LazyVim](https://github.com/LazyVim/LazyVim).
