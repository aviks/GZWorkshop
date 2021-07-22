
WIDTH = 600
HEIGHT = 500
BACKGROUND = colorant"#c54245"
tree_green = colorant"#45c542"

word_list = readlines(joinpath(@__DIR__, "words.txt"))
word_list = strip.(word_list)
word = rand(word_list)
word_array = string.(collect(word))
num_chars = length(word)
answers = fill(" ", num_chars)

letters = string.(collect('a':'z'))

score = 15
state = "playing"

tree_lines = [
     ((340, 300), (340, 260)),
     ((340, 260), (500, 260)),
     ((500, 260), (340, 150)),
     ((340, 150), (450, 150)),
     ((450, 150), (340, 075)),
     ((340, 075), (400, 075)),
     ((400, 075), (300, 000)),
     ((300, 000), (200, 075)),
     ((200, 075), (260, 075)),
     ((260, 075), (150, 150)),
     ((150, 150), (260, 150)),
     ((260, 150), (100, 260)),
     ((100, 260), (260, 260)),
     ((260, 260), (260, 300)),
     ((260, 300), (340, 300)),
]

function draw()
    for i in 1:(15-score)
        draw(Line(tree_lines[i][1]..., tree_lines[i][2]...), tree_green )
    end

   for i in 1:num_chars
        draw(Line(50i, 450, 50i+40, 450), colorant"white")
        draw(Line(50i, 451, 50i+40, 451), colorant"white")
        t = TextActor(answers[i], "moonhouse"; pos = (50i+10, 420))
        draw(t)
   end

   sc = TextActor("Tries: $score", "moonhouse"; pos=(450, 20))
   draw(sc)

   if state == "won"
        st = TextActor("You Won!", "moonhouse"; pos=(200, 220))
        draw(st)
    elseif state == "lost"
        st = TextActor("You Lost :(", "moonhouse"; pos=(200, 220))
        draw(st)
    end
end

function on_key_down(g, k)
    global score
    key_pressed = lowercase(string(k))
    if key_pressed in letters && key_pressed in word_array
        @show "found $key_pressed in word"
        answers[findall(x->x==key_pressed, word_array)] .= key_pressed
    else 
        score = score - 1
    end 

    global state
    if score < 1 
        state = "lost"
    end
    if !(" " in answers)
        state = "won"
    end
end


