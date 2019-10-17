#lang pollen
<html>
<head>
    <meta charset="UTF-8">
    <title>◊(select 'title doc)</title>
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
