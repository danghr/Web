---
layout: default
---

I am currently an M.Eng. student at the [High-throughput Computer Research Center (HTCRC)](http://english.ict.cas.cn/rese/divi/cs/202302/t20230209_326889.html), part of the [Institute of Computing Technology, Chinese Academy of Sciences (ICT, CAS)](http://english.ict.cas.cn), and the [University of Chinese Academy of Sciences (UCAS)](https://english.ucas.ac.cn). I am supervised by [Prof. Dongrui Fan](https://people.ucas.ac.cn/~fandongrui?language=en) and am currently working in the GIMLab, directed by [Assoc. Prof. Mingyu Yan](https://mingyuyan-ict.github.io/MingyuYan-ICT/), focusing on high-throughput graph neural network (GNN) inference systems.

I obtained my B.Eng. degree in Computer Science and Technology from the [School of Information Science and Technology (SIST)](https://sist.shanghaitech.edu.cn/sist_en/) at [ShanghaiTech University](https://www.shanghaitech.edu.cn/eng/). There, I worked in [Toast Lab](https://toast-lab.sist.shanghaitech.edu.cn) with [Assist. Prof. Chundong Wang](https://chundong.wang) on co-optimization of NoSQL databases and file systems. Before this, I gained some experience in the [Attitude Research Lab](https://arlab.sem.shanghaitech.edu.cn/index_en.html) of the [School of Entrepreneurship and Management (SEM)](https://sem.shanghaitech.edu.cn/sem_en/) at [ShanghaiTech University](https://www.shanghaitech.edu.cn/eng/), working with [Assoc. Prof. Lifeng Yang](https://sem.shanghaitech.edu.cn/sem_en/2022/0525/c9766a577111/page.htm) on ethics in information technology.

My research interests broadly encompass computer systems and architecture. In addition to my work on GNN inference systems, I am currently involved in the ["One Student One Chip" (一生一芯)](https://ysyx.oscc.cc/en/) project, learning the implementation of a RISC-V CPU with various test and optimization techniques. I also have some background in operating systems, having completed the [Pintos](https://www.scs.stanford.edu/10wi-cs140/pintos/pintos_1.html) project as part of the Operating Systems I course at ShanghaiTech, where I later served as a TA during the following academic year.

My name is pronounced as:

| | Family Name | Given Name |
|---|---|---|
| **Chinese** | 党 | 浩然 |
| **Pinyin** | Dǎng | Hàorán |
| **IPA** | [tɑŋ] | [xɑʊʐɑn] |


## News

{%- include news_abstract.md -%}
<br>
[[More]](/news)
<p></p> <!-- Compensate the empty space after the list -->


## About Me

### Eductaion

| Time | School |
|---|---|
| 2022-09 - Present | University of Chinese Academy of Sciences <br> Institute of Computing Technology, Chinese Academy of Sciences <br> <small>[Transcript](https://download.danghr.com/transcript/master/transcript-m-en-20241024.pdf) [(GPA Conversion)](https://download.danghr.com/transcript/master/conversion-m-en.pdf) &emsp; [成绩单](https://download.danghr.com/transcript/master/transcript-m-zh-20241024.pdf)[（GPA算法）](https://jwb.ucas.ac.cn/index.php/zh/gzzd/kcsz/80-2021-06-10-03-03-19)</small> |
| 2018-09 - 2022-06 | ShanghaiTech University <br> <small>[Transcript](https://download.danghr.com/transcript/bachelor/transcript-b-en-esign-20220704.pdf) &emsp; [成绩单](https://download.danghr.com/transcript/bachelor/transcript-b-zh-esign-20220704.pdf)</small> |


### Publications

{%- include publications_abstract.md -%}
<br>
[[Full Publication List]](/publications)
<p></p> <!-- Compensate the empty space after the list -->


### Research Projects

- **GDL-GNN: GPU Dataloading for GNN Inference** &ensp; [[Paper]](https://doi.org/10.1007/978-3-031-69766-1_24) &ensp; [[Code]](https://github.com/danghr/GDL-GNN)
  - **Motivation:** Graph neural networks (GNNs) suffer from performance bottlenecks due to inefficient data transfer between host and device memory during inference.
  - **Solution:**
    - *Partition the large graph into subgraphs that can fit in GPU memory.* Include features of halo nodes (the neighbors outside the partition) to ensure all the data required for the inference of a subgraph is contained within the subgraph itself, avoiding memory access outside the GPU during inference.
    - *Use hop-masks to avoid unnecessary computation and storage.* Compute only on the necessary nodes of each layer in the GNN model to reduce both memory and time consumption.
    - *Hide load latency and optimize for multiple GPUs.* Overlap the inference of the current subgraph with the loading of the next one. Distribute subgraphs dynamically across GPUs to achieve natural load balancing.
  - **Result:** Significantly reduces inference time while maintaining the accuracy of full-graph inference.
- **NobLSM: LSM-tree with Non-blocking Writes** &ensp; [[Paper]](https://doi.org/10.1145/3489517.3530470)
  - **Motivation:** NoSQL databases using log-structured merge (LSM) trees often experience performance bottlenecks during the compaction process, with a significant portion of the latency caused by blocking `sync` operations when generating new SSTable files.
  - **Solution:**
    - *Delay the deletion of old SSTables until the new SSTable is safely stored.* Use a `map` to track the relationship between old and new SSTables, keeping the old ones until the new ones are safely stored.
    - *Utilize the periodic commit of the file-system journal.* Since the commit of a journal transaction containing the `inode` occurs after the data blocks are written on the disk, this commit ensures the safe storage of the file.
    - Based on the above mechanisms, *safely remove the blocking `fsync`/`fdatasync` operations during the generation of SSTables in compactions*.
  - **Result:** Outperforms state-of-the-art competitors while maintaining the same level of consistency.
<p></p> <!-- Compensate the empty space after the list -->


### Coursework Projects

- **[The "One Student One Chip" (一生一芯) Project](https://ysyx.oscc.cc/en/)** <br> Student ID: ysyx_24070014 &ensp; [[Learning Record]](https://www.danghr.com/ysyx/record) &ensp; [[Code]](https://www.danghr.com/ysyx/code)
  - **Software:** Implemented NEMU, a RISC-V emulator for teaching purposes, supporting RV32IM instructions up to now.
    - Support execution of RV32IM instructions.
    - Implement some library functions: `str_` and `mem_` functions in `string.c`, and `sprintf` with `%d`, `%u` and `%s`.
    - Use Spike as a reference source for differential testing, comparing register status after execution of every instruction.
  - **Hardware:** Currently developing a single-cycle RISC-V CPU using Verilog.
- **[Pintos](https://www.scs.stanford.edu/10wi-cs140/pintos/pintos_1.html)** <small>(As the course project of Operating Systems I in ShanghaiTech)</small>
  - Implemented a multi-threading kernel with scheduling & thread management, user program & system calls, virtual memory, and file system with buffer cache.
<p></p> <!-- Compensate the empty space after the list -->


### Teaching

| Time | Course | Role | Location |
|------|--------|------|----------|
| Fall, AY 2021-2022 | Operating Systems I | TA | ShanghaiTech |


### Academic Awards

| Time | Award | Awarded By |
|------|-------|------------|
| 2024-05 | Outstanding Student (AY 2023-2024) | UCAS |
| 2022-06 | Outstanding Thesis <small>(for undergraduate FYP)</small> | SIST, ShanghaiTech |


## Miscellaneous

### Buy the book "信息科学技术伦理与道德" (*Ethics and Morality in Information Science and Technology*)!

Based on the course of the same name provided in ShanghaiTech, this book comprehensively discusses the potential ethical and social impact of recent technology advancement in information science. 
Topics include ethical principles, AI decision, big data, privacy, digital identity, etc. [[Details]](/news/2023/12/ethics_book.html)

You can buy it at [JD.com](https://item.jd.com/13961643.html), or from other bookstores and shopping platforms.
