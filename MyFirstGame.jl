
HEIGHT = 400
WIDTH = 400
BACKGROUND = colorant"purple"
alien_actor=Actor("alien.png")
alien_actor.pos = (120, 180)
text_actor = TextActor("Hello JuliaCon!", "moonhouse")
text_actor.pos = (120, 120)

l = Line(50, 100, 350, 100)
r = Rect(50, 100, 20, 50)
c = Circle(330, 80, 20)
i = 0

function draw()
    draw(alien_actor)
    draw(text_actor)
    draw(Line(50, 100+i, 350, 100+i), colorant"yellow")
    draw(c, colorant"white", fill=true)
    draw(r, colorant"black", fill=true)
end

function update()
    alien_actor.x = alien_actor.x + 2
    alien_actor.y = alien_actor.y + 1
    text_actor.y = text_actor.y + 1
    global i 
    i = i+1
end