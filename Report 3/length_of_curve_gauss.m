%% The Length Of A Curve
% This functions calculates the given formula S
% The Integration method used here is
% the Gauss Quadrature method.

% The function takes 4 inputs
% %% a and b are the interval of the intergal
% %% y is a function handle, and is the function
%    that gives the curve.
% %% hi_p is the degree of the polynomial function y.
% 
% the function output z is the value of the itnegral.

function [z] = length_of_curve_gauss(a, b, y, hi_p)
  

% we calculate the derviative
  syms x 
  dydx = eval(['@(x)' char(diff(y(x)))]);
  
% We use the uploaded function lgwt to obtain the points
% weights of the Legendre Polynomials.
% we subtract one from the degree of the polynomial 
% since we differentiated (more input in the report.)
  [zeta, w] = lgwt(( hi_p - 1), -1, 1);
  
% we pass the values to the  modified version of 
% the uploaded function Gauss_quad.
% We save the result in z.
  z = Gauss_quad_modified(sqrt(1 + (dydx(x)^2)), a, b, zeta, w);
  
  
end

