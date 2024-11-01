def czet(array, ind, k):
    if len(array) == 1:
        return array[0]
    else:
        index = ((k + ind) % len(array))
        if index == 0:
            array.pop()
            return czet(array, 0, k)
        else:
            array.pop(index-1)
            return czet(array, index-1, k)

n = int(input())
k = int(input())
array = []
for i in range(1, n+1):
    array.append(i)
winner = czet(array, 0, k)
print(winner)