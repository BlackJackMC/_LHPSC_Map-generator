from PIL import Image, ImageDraw
import game_map

color_map = dict({0:(3, 190, 252), 1:(252, 186, 3), 2:(255, 0, 0), 3:(0, 0, 0)})

def generate_map(length: int, trash_ratio: float, obstacle_ratio: float, mountain_ratio: float) -> list:
    map_ptr = game_map.generate_map(8, trash_ratio, obstacle_ratio, mountain_ratio)
    terrain = [[map_ptr[i][j] for i in range(length)] for j in range(length)]
    return terrain

def visualize(length: int) -> None:
    image = Image.new("RGB", (length, length), "white")
    draw = ImageDraw.Draw(image)
    for i in range(len(terrain)):
        for j in range(len(terrain[0])):
            fill_color = color_map[terrain[i][j]]
            draw.rectangle([(i + 100 * i, j + 100 * j), (i + 100 + 100 * i, j + 100 + 100 * j)], fill = fill_color)

    image.save("result.png")

def main():
    global terrain

    length: int = 8 
    trash_ratio = float(input())
    obstacle_ratio = float(input())
    mountain_ratio = float(input())
    terrain = generate_map(length, trash_ratio, obstacle_ratio, mountain_ratio)
    visualize(length * 100)




if __name__ == '__main__':
    main()