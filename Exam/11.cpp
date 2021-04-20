#include <iostream>
#include <list>
#include <vector>

typedef std::vector<int> Row;
typedef std::vector<Row> Matrix;
typedef std::pair<int, int> Coords;

enum State {
    EMPTY,
    FILLED,
    DROPPED
};

void printField(Matrix &field) {
    int M = field.size();
    int N = field.front().size();
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            std::cout << field[i][j] << " ";
        }
        std::cout << std::endl;
    }
}

void runFilling(int i, int j, int M, int N, Matrix& field) {
    std::list<Coords> queue;
    queue.push_back(Coords(i, j));
    while (!queue.empty()) {
        Coords coords = queue.front();
        queue.pop_front();
        int x = coords.first;
        if (x < 0 || x >= M) continue;
        int y = coords.second;
        if (y < 0 || y >= N) continue;
        if (field[x][y] != State::EMPTY) continue;
        field[x][y] = State::FILLED;
        queue.push_back(Coords(x - 1, y));
        queue.push_back(Coords(x + 1, y));
        queue.push_back(Coords(x, y - 1));
        queue.push_back(Coords(x, y + 1));
    }
}

int main() {
    int M, N;
    std::cin >> M >> N;
    Matrix field(M, Row(N, State::EMPTY));

    int K;
    std::cin >> K;
    for (int it = 0; it < K; ++it) {
        int i, j;
        std::cin >> i >> j;
        field[i][j] = State::DROPPED;
    }

    printField(field);

    int parts = 0;
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            if (field[i][j] == State::EMPTY) {
                parts++;
                runFilling(i, j, M, N, field);
            }
        }
    }
    std::cout << parts << std::endl;
}