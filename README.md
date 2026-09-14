# 经验萃取师 · AstraFlow Agent Plugin（技能）

> 这是一份符合 **Agent Plugin v1.0.0** 开放标准的 AstraFlow 技能包。AstraFlow 客户端的「Import Agent Plugin from GitHub」按此标准从 GitHub 仓库识别并加载技能。仓库根（本目录）= 插件根。

## 这个技能是干什么的

帮助 UCloud 内训师、技术专家或项目骨干，把"做过但讲不清"的项目经验，通过 AI 多轮追问，提炼成结构化方法论卡片和可直接用于内训的教学题。

## 适用人群

- 内训师：要备课但缺案例
- 技术专家：做过很多项目，但让他说方法时只能说"看情况"
- 项目经理/骨干：想把隐性经验留成组织资产

## 仓库结构（必须保持，否则 AstraFlow 识别不到）

```
经验萃取师_AstraFlow_Skill/        ← 仓库根 / 插件根（推到 GitHub 的就是这个目录）
├── plugin.json                    ← 插件清单（必需，标准字段）
├── README.md                      ← 本说明
└── skills/
    └── 经验萃取师/
        ├── SKILL.md               ← 技能本体：角色设定 + EXTRACT 五环 + 铁律
        └── references/
            └── 三层追问脚本.md     ← 备用追问脚本库
```

> 注意：标准要求的技能必须放在 `skills/<技能名>/SKILL.md`。不要把 `SKILL.md` 直接放根目录，否则 `Import Agent Plugin` 扫描不到。

## 上传 / 导入步骤

### A. 推到 GitHub（老易 / 管理员操作）

1. 在 GitHub 新建一个仓库，仓库名 `experience-extraction`（README 勾不勾都行，下面脚本会处理）。
2. 把本目录的**全部内容**（plugin.json、README.md、skills/）推上去。三种方式任选：

   **方式一：运行现成脚本（最简单，推荐）**
   - Windows 用户：双击 `push_to_github.bat`
   - PowerShell 用户：右键 `push_to_github.ps1` → "使用 PowerShell 运行"
   - 脚本会自动完成：改分支名为 `main` → 添加远程仓库 → 如果 GitHub 仓库有 README 就先拉取合并 → 推送。
   - 运行时如果要求输入凭据：用户名 `brucelaoyi`，密码填你的 **Personal Access Token**。

   **方式二：git 命令行手动推送**
   ```bash
   git branch -M main
   git remote add origin https://github.com/brucelaoyi/experience-extraction.git
   git pull origin main --rebase --allow-unrelated-histories
   git push -u origin main
   ```
   用户名：`brucelaoyi`；密码：Personal Access Token。

   **方式三：网页拖拽（不太推荐）**
   GitHub 网页只能逐个文件/文件夹上传，容易多嵌套一层目录导致 AstraFlow 识别失败。如果一定要用，进仓库后找 "Quick setup" 段落里的蓝色链接 **"uploading an existing file"**，分别上传 `plugin.json`、`README.md`、`skills/` 文件夹整体。

3. 仓库可见性：内训师都要用就设 **Public**；仅 UCloud 内部用可设 **Private**（但 AstraFlow 导入需有读取权限）。

### B. 在 AstraFlow 客户端导入（内训师操作）

1. 打开 AstraFlow 客户端（用 UCloud 给的 API 登录）。
2. 技能管理 → **Import Agent Plugin from GitHub**。
3. 填入仓库地址（如 `https://github.com/你的用户名/experience-extraction`）或 `你的用户名/experience-extraction`。
4. 确认导入，技能列表出现「经验萃取师」即可。

### C. 调用

在任意对话里调用 `/经验萃取师`（或界面等价入口），说：

> 我有个项目，当时做成了，但我说不清到底做对了什么，你帮我萃取一下。

之后跟随 AI 的五环追问一步步回答，最终得到 9 要素《经验萃取单》。

## 产出物

- 9 要素《经验萃取单》：关键场景、核心问题、关键决策、判断依据、解决思路、方法策略、适用边界、新人易错点、教学素材
- 可直接用于课堂的决策题 / 情境题 / 讨论题

## 与文档整理型 Skill 的区别

AstraFlow 技能市场里有些 Skill 是"读文件夹/文档做整理"。本技能不是——它解决的是"经验在脑子里、还没写成文档"的隐性知识，通过五环追问把它"问出来"。

## Git 推送命令（如果脚本跑不了，在「经验萃取师_AstraFlow_Skill」目录内执行）

```bash
git branch -M main
git remote add origin https://github.com/brucelaoyi/experience-extraction.git
git pull origin main --rebase --allow-unrelated-histories
git push -u origin main
# 用户名：brucelaoyi
# 密码：Personal Access Token（不是 GitHub 登录密码）
```

**没有 Personal Access Token？** 去 https://github.com/settings/tokens → **Tokens (classic)** → **Generate new token** → 勾选 **`repo`** 权限 → 生成后复制那串字符串当密码用。

## 调试

导入后若追问偏浅 / 不按五环走，改 `skills/经验萃取师/SKILL.md` 里的「铁律」后重新推送并重新导入即可。
