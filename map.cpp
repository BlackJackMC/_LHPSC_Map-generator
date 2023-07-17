#include <bits/stdc++.h>
#include <chrono>
#include <random>

using namespace std;
using namespace chrono;

vector<vector<int>> game_map;
vector<vector<int>> trash_mask;

const int dx[4] = {0, -1, 0, 1};
const int dy[4] = {-1, 0, 1, 0};

const int EMPTY = 0;
const int TRASH = 1;
const int OBSTACLE = 2;
const int MOUNTAIN = 3;

double rand_range(int min, int max)
{
    mt19937 generator(steady_clock::now().time_since_epoch().count());
    uniform_real_distribution<double> distribution(min, max);
    return distribution(generator);
}

void print()
{
    for (const auto i : game_map)
    {
        for (const auto j : i)
        {
            cout << j << " ";
            cerr << j << " ";
        }
        cerr << "\n";
        cout << "\n";
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

void put(int target, function<bool(int, int)> valid, double ratio = 0.5)
{
    for (int i = 0; i < game_map.size(); i++)
    {
        for (int j = 0; j < game_map[i].size(); j++)
        {
            if (valid(i, j) and gacha(ratio))
            {
                game_map[i][j] = target;
            }
        }
    }
}

void generate_trash_mask()
{
    for (int i = 0; i < trash_mask.size(); i++)
    {
        for (int j = 0; j < trash_mask[i].size(); j++)
        {
            for (int k = 0; k < 4; k++)
            {
                trash_mask[i][j] += out_of_bound(i + dx[k], j + dy[k]);
            }
        }
    }
}

int main()
{
    freopen("terrain.txt", "w", stdout);
    game_map.resize(8, vector<int>(8, 0));
    trash_mask.resize(8, vector<int>(8, 0));
    auto is_empty_around = [](int i, int j) 
    {
        for (int k = 0; k < 4; k++)
        {
            if (!out_of_bound(i + dx[k], j + dy[k]))
            {
                if (game_map[i + dx[k]][j + dy[k]] != EMPTY)
                {
                    return false;
                }
            }
        }
        return true;
    };
    auto is_the_same_around = [](int i, int j)
    {
        if (game_map[i][j] != EMPTY)
        {
            return false;
        }
        for (int k = 0; k < 4; k++)
        {
            if (!out_of_bound(i + dx[k], j + dy[k]))
            {
                if (game_map[i + dx[k]][j + dy[k]] != game_map[i][j])
                {
                    return false;
                }
            }
        }
        return true;
    };
    auto is_not_blocking_path = [](int i, int j)
    {
        for (int k = 0; k < 4; k++)
        {
            if (out_of_bound(i + dx[k], j + dy[k]) or trash_mask[i + dx[k]][j + dy[k]] >= 3)
            {
                return false;
            }
        }
        for (int k = 0; k < 4; k++)
        {
            if (!out_of_bound(i + dx[k], j + dy[k]))
            {
                trash_mask[i + dx[k]][j + dy[k]]++;
            }
        }
        return true;
    };
    put(TRASH, is_empty_around, 0.3);
    put(OBSTACLE, is_the_same_around, 0.3);
    generate_trash_mask();
    put(MOUNTAIN, is_not_blocking_path, 0.8);
    print();
}