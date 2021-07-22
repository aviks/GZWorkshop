HEIGHT = 650
WIDTH = 400
SPEED = 2
GAP = 100

bird = Actor("bird1")
bird.pos = (75, 200)
pipe_top = Actor("top")
pipe_bottom = Actor("bottom")
bird_dead = false
bird_vy = 0.0
GRAVITY = 0.3
FLAP_STRENGTH = 5.0 

function reset_pipes()
    pipe_gap_y = rand(200:(HEIGHT - 200))
    pipe_top.bottomleft = (WIDTH, pipe_gap_y - GAP ÷ 2)
    pipe_bottom.topleft = (WIDTH, pipe_gap_y + GAP ÷ 2)
end

reset_pipes()

function draw()
    draw(pipe_top)
    draw(pipe_bottom)
    draw(bird)
end

function update()
    update_bird()
    update_pipes()
end

function update_bird()
    global bird_vy
    global bird_dead
    uy = bird_vy
    bird_vy = bird_vy + GRAVITY
    bird.y += Int(round((uy + bird_vy)/2))
    bird.x = 75

    if collide(bird, pipe_top) || collide(bird, pipe_bottom)
        bird_dead = true
        bird.image = "birddead"
    end
end

function update_pipes()
    pipe_top.left = pipe_top.left - SPEED
    pipe_bottom.left = pipe_bottom.left - SPEED
    if pipe_top.right < 0
        reset_pipes()
    end
end

function on_key_down(g::Game)
    global bird_vy
    if !bird_dead
        bird_vy = -FLAP_STRENGTH
    end
end