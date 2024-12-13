* Milestone 1: On GradeScope, the Grading comment: File contents not clear enough for someone to understand how contributions to the project should be made
    - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/1b386123f529db64f3cd74944f8d70a1e4ba6723#diff-eca12c0a30e25b4b46522ebf89465a03ba72a03f540796c979137931d8f92055R4

* Milestone 1: On GradeScope, the Grading comment: The analysis notebook (.ipynb or .Qmd or *Rmd) should be in a sub-directory called something sensible, such as analysis, src, notebooks, docs, etc, to aid in the discoverability of this file, and related ones. Having too many files in the project root makes the project organization less understandable and can lead to longer activation times to productivity for collaborators (including future you!). Files such as .DS_Store and .ipynb_checkpoints should not be committed.
    - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/d03e62f277a63c82c5b1b312b85420c5e2c1a0b7

* Milestone 1: On GradeScope, the Grading comment: Important methodology descriptions missing (e.g., did not explain in narrative what metric was being used for model parameter optimization).
* Review comments from jasonmiee: Model Performance: I suggest adding a sentence that clarifies why RMSPE was used as the scoring metric for this analysis. (i.e Did you use this metric because you wanted an interpretable error metric that has the same units as the response variable?)
    - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/c1a3fddb4f3ee6778fd37131a626bd47e70417bc#diff-55f43050dc09f2fd89ea3b8cf9eb777be6cd5c65a94a47bf31cb39e5347bd264R3302

* Review comments from gurmehak:
    - Analysis Report Quality: The report is concise and very readable overall, but the code chunk in the summary section of your analysis report could be off-putting for someone without a technical background. I believe you tried to suppress the code chunk with echo: False in that particular code block, but it didn't render correctly in the final report. To ensure this is applied globally, include the command in the YAML section of the QMD file. This way, you won't have to specify it in each code block to prevent the code display.
        - URL of Improvement:  https://github.com/shikexi6/marathon-analysis/commit/18d82ded5aaccf158cb41c9691c65bdc0ffdcd2e
    - File Structure: Great work on organizing the file structure - it’s very clean and generally easy to navigate. I did get a bit confused with identical output figures saved in different folders. You have placed your figures in both the results and report/fig-html folders, and raw data in data and reports/data folders. Ideally, the reports folder should only contain files that are ready to be shared as deliverables. Please consider removing data and figures from reports folder. You can also consider creating more subfolders (for raw, train/test splits, processed data, etc) within the data folder to better organize the contents and make processed data more readily available for use
        - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/b0c184de266ea88c886091836461c52f033f186b

* Review comments from Arc-Celt: I noticed that the code chunk used for the data validation check is still visible in your final PDF report, even though you applied #| include: false and #| echo: false in your script. Hence, it's recommended that you try how to suppress that chunk as well.
    - URL of Improvement:  https://github.com/shikexi6/marathon-analysis/commit/18d82ded5aaccf158cb41c9691c65bdc0ffdcd2e

* Review comments from vrudhgarg:
    - Guidelines on Style: The code would benefit from more comments and explanations. Documenting the code will help readers understand why certain parts of the code work the way they do.
        - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/2ed0b28e6df4202c99d6345bab844d4e801c1b5e
    - Research Question Clarity: The research question should be worded more clearly so others can understand it clearly when reviewing the project.
        - URL of Improvement: https://github.com/shikexi6/marathon-analysis/commit/e2f0ef9043e60e59338411122efef3d1dec31976


