from PIL import Image, ImageDraw

color_map = dict({0:(3, 190, 252), 1:(252, 186, 3), 2:(255, 0, 0), 3:(0, 0, 0)})

def read_terrain(height: int) -> None:
    for _ in range(height):
        terrain.append([int(i) for i in file.readline().strip("\n").split(" ") if i])

def visualize(width: int, height: int) -> None:
    image = Image.new("RGB", (width, height), "white")
    draw = ImageDraw.Draw(image)
    for i in range(len(terrain)):
        for j in range(len(terrain[0])):
            fill_color = color_map[terrain[i][j]]
            draw.rectangle([(i + 100 * i, j + 100 * j), (i + 100 + 100 * i, j + 100 + 100 * j)], fill = fill_color)

    image.show()

def main():
    global terrain, file

    file = open("terrain.txt", "r")
    width: int = int(open("test.txt", "r").read())
    height: int = width   
    terrain = []
    read_terrain(height)
    print(terrain)
    visualize(width * 100, height * 100)
    file.close()




if __name__ == '__main__':
    main()