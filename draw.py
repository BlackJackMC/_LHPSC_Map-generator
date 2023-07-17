from PIL import Image, ImageDraw
import ctypes

color_map = dict({0:(3, 190, 252), 1:(252, 186, 3), 2:(255, 0, 0), 3:(0, 0, 0)})

def generate_map(length: int) -> list:
    map = ctypes.CDLL('F:\Project\_LHPSC_Map-generator\map.dll')
    map.generate_map.restype = ctypes.POINTER(ctypes.POINTER(ctypes.c_int))
    map_ptr = map.generate_map()
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
    terrain = generate_map(length)
    visualize(length * 100)




if __name__ == '__main__':
    main()