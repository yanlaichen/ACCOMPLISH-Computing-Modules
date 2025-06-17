function derVal = numerical_differentiation(f, x0, h, method)
    % numerical_differentiation computes the derivative of function f at point x0
    % using the specified numerical differentiation method.
    %
    % Inputs:
    %   f      - Function handle representing f(x)
    %   x0     - Point at which to approximate the derivative
    %   h      - Step size
    %   method - String specifying the differentiation method
    %
    % Output:
    %   derVal - Approximated derivative value at x0

    switch method
        case 'Forward Difference'
            derVal = forwardDifference(f, x0, h);
        case 'Backward Difference'
            derVal = backwardDifference(f, x0, h);
        case 'Three-Point (central)'
            derVal = threePointDifference_central(f, x0, h);
        case 'Three-Point (forward)'
            derVal = threePointDifference_forward(f, x0, h);
        case 'Three-Point (backward)'
            derVal = threePointDifference_backward(f, x0, h);
        case 'Five-Point (central)'
            derVal = fivePointDifference_central(f, x0, h);
        otherwise
            uialert(app.UIFigure, 'Unknown method selected.', 'Method Error');
            return;
    end
end

function derVal = forwardDifference(f, x0, h)
    % forwardDifference approximates the derivative using the forward difference method.
    %
    % Students: Implement the forward difference formula here.
    % Hint: Use f(x0 + h) and f(x0) to compute the approximation.

    derVal = NaN; % Placeholder value
end

function derVal = backwardDifference(f, x0, h)
    % backwardDifference approximates the derivative using the backward difference method.
    %
    % Students: Implement the backward difference formula here.
    % Hint: Use f(x0) and f(x0 - h) to compute the approximation.

    derVal = NaN; % Placeholder value
end

function derVal = threePointDifference_central(f, x0, h)
    % threePointDifference_central approximates the derivative using the central difference method.
    %
    % Students: Implement the three-point central difference formula here.
    % Hint: Use f(x0 + h) and f(x0 - h) to compute the approximation.

    derVal = NaN; % Placeholder value
end

function derVal = threePointDifference_forward(f, x0, h)
    % threePointDifference_forward approximates the derivative using the forward three-point method.
    %
    % Students: Implement the three-point forward difference formula here.
    % Hint: Use f(x0), f(x0 + h), and f(x0 + 2*h) to compute the approximation.

    derVal = NaN; % Placeholder value
end

function derVal = threePointDifference_backward(f, x0, h)
    % threePointDifference_backward approximates the derivative using the backward three-point method.
    %
    % Students: Implement the three-point backward difference formula here.
    % Hint: Use f(x0), f(x0 - h), and f(x0 - 2*h) to compute the approximation.

    derVal = NaN; % Placeholder value
end

function derVal = fivePointDifference_central(f, x0, h)
    % fivePointDifference_central approximates the derivative using the five-point central difference method.
    %
    % Students: Implement the five-point central difference formula here.
    % Hint: Use f(x0 - 2*h), f(x0 - h), f(x0 + h), and f(x0 + 2*h) to compute the approximation.

    derVal = NaN; % Placeholder value
end



