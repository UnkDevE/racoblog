#lang pollen
<html>
<head>
    <meta charset="UTF-8">

    <link rel="stylesheet" href="./highlight/styles/default.css">
    <script src="./highlight/highlight.pack.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.6/config/TeX-AMS-MML_HTMLorMML.js" integrity="sha256-4zys9A4hMQmtq2EUL+JRoXc0NZi8jVJMzb8onewOaSQ=" crossorigin="anonymous"></script>
    <script type="text/x-mathjax-config">
        MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$']]}});
    </script>

    <link rel="stylesheet" href="./post.css">
    <title>◊(select 'title doc)</title.>
</head>
    <body>
        <a name="top"></a>
        <h1 class="title">◊(select 'title doc)</h1>
        <div class="navi">
            ◊(define newer-pagetrees
                (rest (memq here (children 
                    (parent (here (current-pagetree))) 
                (current-pagetree))))
            )
            ◊when/splice[(and (not (next here)) (empty? newer-pagetrees))]{
                <a class="triangle-up" href="◊|(first (children newer-pagetrees))|"></a>
            }
                            
            ◊when/splice[(next here)]{
                <a class="triangle-up" href="◊|(next here)|"></a>
            }
            ◊when/splice[(previous here)]{
                <a class="triangle-down" href="◊|(previous here)|"></a>
            }
        </div> 
        <div class="body">◊|(->html)|</div>
        <script src="https://utteranc.es/client.js"
            repo="unkdeve.github.io"
            issue-term="pathname"
            theme="github-light"
            crossorigin="anonymous"
            async>
        </script>
        <div class="navi">
            <a class="trangle-up" href="#top"></a>
            ◊when/splice[(previous here)]{
                <a class="triangle-down" href="◊|(previous here)|"></a>
            }
            ◊(define older-pagetrees
                (rest (memq here (reverse (children 
                    (parent (here (current-pagetree))) 
                (current-pagetree))))
            )
            ◊when/splice[(and (not (previous here)) (empty? older-pagetrees))]{
                <a class="triangle-down" href="◊|(first (children older-pagetrees))|"></a>
            }
        </div>
    </body>
</html>
