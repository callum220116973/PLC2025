#gathering input from for element one and the last element
input_a = int(input())
input_b = int(input())

#taking arguments in the parameters because we will have to pass input_a and input_b through these parameters soon.
def listFunc(a, b):
    #we now create the list from a to b
    return list(range(a, b))  # Creates list from a to b-1
# we now pass a and b into our parameters of the application Func
def applicatorFunc(inpFunc, s, a, b):
    if s == 's':
        return sum(inpFunc(a, b))  # Pass a and b to inpFunc
    return sum(inpFunc(a, b)) / len(inpFunc(a, b)) if inpFunc(a, b) else 0  # Prevent division by zero
# we then pass input_a and input_b through our parameters because this will be used in conjuction with applicationFunc
print(applicatorFunc(listFunc, 's', input_a, input_b))