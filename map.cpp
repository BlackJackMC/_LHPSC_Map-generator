#include <bits/stdc++.h>
#include <chrono>
#include <random>

using namespace std;
using namespace chrono;

vector<vector<int>> game_map;

const int dx[4] = {0, -1, 0, 1};
const int dy[4] = {-1, 0, 1, 0};

const int EMPTY = 0;
const int TRASH = 1;

double rand_range(int min, int max)
{
    mt19937 generator(steady_clock::now().time_since_epoch().count());
    uniform_real_distribution<double> distribution(min, max);
    return distribution(generator);
}

void print()
{
    for (const auto i: game_map)
    {
        for (const auto j: i)
        {
            cerr << j << " ";
        }
        cerr << "\n";
    }
}

bool out_of_bound(int x, int y)
{
    return (x < 0 or x >= game_map.size() or y < 0 or y >= game_map[0].size());
}

bool gacha(double ratio)
{
    const int min = 1, max = 100;
    double rand_result = rand_range(min, max);

    return rand_result <= ratio * 100;

}

//trash game_map
void trash(double ratio = 0.5)
{
    for (int i = 0; i < game_map.size(); i++)
    {
        for (int j = 0; j < game_map[i].size(); j++)
        {
            bool clear = true;
            for (int k = 0; k < 4; k++)
            {
                if (!out_of_bound(i + dx[k], j + dy[k]))
                {
                    if (game_map[i + dx[k]][j + dy[k]] != EMPTY)
                    {
                        clear = false;
                    }
                }
            }
            if (clear and gacha(ratio))
            {
                game_map[i][j] = TRASH;
            }
        }
    }
}

void put(double ratio = 0.5, bool (*valid)(int, int))
{
    for (int i = 0; i < game_map.size(); i++)
    {
        for (int j = 0; j < game_map[i].size(); j++)
        {
            if (valid(i, j) and gacha(ratio))
            {
                game_map[i][j] = TRASH;
            }
        }
    }
}

int main()
{
    int length = 8;
    game_map.resize(length, vector<int>(length, 0));
    trash(0.3);
    put(0.5, [](int i, int j){
        
    })
    print();
}