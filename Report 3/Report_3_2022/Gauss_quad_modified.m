% ----------------------------------------------------------------- %
% Gauss Numerical Integration for univariate, finite integrals      % 
% in the form of I=\int_a^b f(x) dx                                 %
% Programmed by X S Yang (Cambridge University) @ 2007              %
% ----------------------------------------------------------------- %  
% Numerical integration by 7-point Gaussian Quadrature.             %
% For detail, please refer to Chapter 9 and Appendix B of the book  %
% Xin-She Yang, Mathematical Modelling for Earth Sciences,          %
%               Dunedin Academic Press, UK, (2008).                 %
% ----------------------------------------------------------------- %
% Usage: Gauss(function_str,a,b)   E.g. Gauss('(sin(x)/x)^2',0,pi); % 
% ----------------------------------------------------------------- %
 
% ----------------------------------------------------------------- %
% This comment section is written by Ahmed Helali.                  %
% This function is modified to take the zeta and w as inputs.       % 
% It is still the same function exactly, I just wanted to give      %  
% myself more fredoom in the code without the need to hardwire      %
% the inputs and have a more dynamic approach.                      %
% Also, in the line f=vectorize(inline(fstr, 't')); the 't' was     %
% added, so to avoid the error that there is no variable in passed  %
% function fstr. We also changed Index=1:2; in line to              %
% to Index=1:length(w); to account for all weights and points.      %
% ----------------------------------------------------------------- %

function [I]=Gauss_quad_modified(fstr,a,b, zeta, w) 
format long;  
% Usage and default function is the error function
if nargin<3,
disp('Usage:Gauss(integrand,a,b)');
disp('E.g., Gauss(''exp(-x^2)*2/sqrt(pi)'',-1,1);');
end
% Default function and values if no input is given
if nargin<1, % line 7
help Gauss.m;
fstr='exp(-x^2)*2/sqrt(pi)';
a=-1.0; b=1.0;
end 
% Converting the input integrand, fstr, into a function f(x)
f=vectorize(inline(fstr, 't'));
% Seven-point integration scheme so zeta_1 to zeta_7
%zeta=[-0.9491079123; -0.7415311855; -0.4058451513; 0.0; 0.4058451513; 0.7415311855; 0.9491079123];
%zeta=[-0.577350269189626; 0.577350269189626];
% Weighting coefficients

%w=[0.1294849661; 0.2797053914; 0.3818300505; 0.4179591836; 0.3818300505; 0.2797053914; 0.1294849661];
%w=[1;1]
% Index for the seven points
Index=1:length(w); 
% Gauss Integration

I=(b-a)/2 * sum(w(Index).*f((b-a).*(zeta(Index)+1)/2+a));
% Display the result
%disp(' '); disp(strcat('The integral = ', num2str(I)));  