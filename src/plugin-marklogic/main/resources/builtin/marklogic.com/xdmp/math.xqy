xquery version "1.0-ml" encoding "UTF-8";
(:~
 : MarkLogic math functions
 :
 : @see https://docs.marklogic.com/math
 :
 : This documentation includes material copied from or derived from the XPath and
 : XQuery Functions and Operators 3.1 specifications. Copyright © 2017 W3C®
 : (MIT, ERCIM, Keio, Beihang).
 :)
module namespace math = "http://marklogic.com/xdmp/math";

declare namespace a = "http://reecedunn.co.uk/xquery/annotations";
declare namespace o = "http://reecedunn.co.uk/xquery/options";

declare option o:requires "marklogic/5.0";

(:~
 : Returns an approximation to the mathematical constant π.
 :
 : This function returns the <code>xs:double</code> value whose lexical
 : representation is 3.14159265358979e0.
 :)
declare %a:since("marklogic", "6.0") %a:until("marklogic", "7.0", "math:pi#0") function math:PI() as xs:double external;
(:~
 : Returns the arc cosine of the argument.
 :
 : The result is the arc cosine of <code>$arg</code>, as defined in the IEEE
 : 754-2008 specification of the acos function applied to 64-bit binary
 : floating point values. The result is in the range zero to +π radians.
 :
 : <h1>Notes</h1>
 :
 : If <code>$arg</code> is outside the domain of the function, that is the
 : absolute value is greater than one, or if an overflow or underflow occurs,
 : the dynamic error <code>XDMP-DOMAIN</code> is produced.
 :
 : If <code>$arg</code> is <code>NaN</code>, then the result is <code>NaN</code>.
 :
 : In other cases the result is an <code>xs:double</code> value representing an
 : angle θ in radians in the range 0 &lt;= θ &lt;= +π.
 :)
declare %a:since("marklogic", "5.0") function math:acos($arg as xs:double) as xs:double external;
(:~
 : Returns the arc sine of the argument.
 :
 : The result is the arc sine of <code>$arg</code>, as defined in the IEEE
 : 754-2008 specification of the asin function applied to 64-bit binary
 : floating point values. The result is in the range -π/2 to +π/2 radians.
 :
 : <h1>Notes</h1>
 :
 : If <code>$arg</code> is outside the domain of the function, that is the
 : absolute value is greater than one, or if an overflow or underflow occurs,
 : the dynamic error <code>XDMP-DOMAIN</code> is produced.
 :
 : If <code>$arg is positive or negative zero, or <code>NaN</code>, the result
 : is <code>$arg</code>.
 :
 : In other cases the result is an <code>xs:double</code> value representing an
 : angle θ in radians in the range -π/2 &lt;= θ &lt;= +π/2.
 :)
declare %a:since("marklogic", "5.0") function math:asin($arg as xs:double) as xs:double external;
(:~
 : Returns the arc tangent of the argument.
 :
 : The result is the arc tangent of <code>$arg</code>, as defined in the IEEE
 : 754-2008 specification of the atan function applied to 64-bit binary floating
 : point values. The result is in the range -π/2 to +π/2 radians.
 :
 : <h1>Notes</h1>
 :
 : If <code>$arg</code> is positive or negative infinity, the result is
 : positive or negative π/2.
 :
 : If <code>$arg</code> is positive or negative zero, the result is
 : <code>$arg</code>.
 :
 : If <code>$arg</code> is <code>NaN</code>, then the result is <code>NaN</code>.
 :
 : In other cases the result is an <code>xs:double</code> value representing an
 : angle θ in radians in the range -π/2 &lt;= θ &lt;= +π/2.
 :)
declare %a:since("marklogic", "5.0") function math:atan($arg as xs:double) as xs:double external;
(:~
 : Returns the angle in radians subtended at the origin by the point on a plane
 : with coordinates (x, y) and the positive x-axis.
 :
 : The result is the value of <code>atan2(y, x)</code> as defined in the IEEE
 : 754-2008 specification of the <code>atan2</code> function applied to 64-bit
 : binary floating point values. The result is in the range -π to +π radians.
 :
 : <h1>Notes</h1>
 :
 : If either argument is <code>NaN</code> then the result is <code>NaN</code>.
 :
 : If <code>$y</code> is positive or negative, and <code>$x</code> is positive
 : and finite, then (subject to rules for overflow, underflow and approximation)
 : the value of <code>math:atan2($y, $x)</code> is <code>math:atan($y div $x)</code>.
 :
 : If <code>$y</code> is positive and <code>$x</code> is negative and finite,
 : then (subject to the same caveats) the value of <code>math:atan2($y, $x)</code>
 : is <code>math:atan($y div $x) + math:pi()</code>.
 :
 : If <code>$y</code> is negative and <code>$x</code> is negative and finite,
 : then (subject to the same caveats) the value of <code>math:atan2($y, $x)</code>
 : is <code>math:atan($y div $x) - math:pi()</code>.
 :)
declare %a:since("marklogic", "5.0") function math:atan2($y as xs:double, $x as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:ceil($x as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:correlation($arg as json:array*) as xs:double? external;
(:~
 : Returns the cosine of the argument. The argument is an angle in radians.
 :
 : The result is the cosine of <code>$θ</code> (which is treated as an angle in
 : radians) as defined in the IEEE 754-2008 specification of the <code>cos</code>
 : function applied to 64-bit binary floating point values.
 :
 : <h1>Notes</h1>
 :
 : If <code>$θ</code> is positive or negative zero, the result is <code>$θ</code>.
 :
 : If <code>$θ</code> is positive or negative infinity, the dynamic error
 : <code>XDMP-DOMAIN</code> is produced.
 :
 : If <code>$θ</code> is <code>NaN</code>, then the result is <code>NaN</code>.
 :
 : Otherwise the result is always in the range -1.0e0 to +1.0e0.
 :)
declare %a:since("marklogic", "5.0") function math:cos($θ as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:cosh($x as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:cot($x as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:covariance($arg as json:array*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:covariance-p($arg as json:array*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:degrees($x as xs:double) as xs:double external;
(:~
 : Returns the value of e<sup>x</sup>.
 :
 : The result is the mathematical constant <code>e</code> raised to the power of
 : <code>$arg</code>, as defined in the IEEE 754-2008 specification of the
 : <code>exp</code> function applied to 64-bit binary floating point values.
 :)
declare %a:since("marklogic", "5.0") function math:exp($arg as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:fabs($x as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:floor($x as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:fmod($x as xs:double, $y as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:frexp($x as xs:double) as (xs:double, xs:integer) external;
declare %a:since("marklogic", "5.0") function math:ldexp($y as xs:double, $i as xs:integer) as xs:double external;
declare %a:since("marklogic", "6.0") function math:linear-model($arg as json:array*) as math:linear-model? external;
declare %a:since("marklogic", "6.0") function math:linear-model-coeff($linear-model as math:linear-model) as xs:double* external;
declare %a:since("marklogic", "6.0") function math:linear-model-intercept($linear-model as math:linear-model) as xs:double external;
declare %a:since("marklogic", "6.0") function math:linear-model-rsquared($linear-model as math:linear-model) as xs:double external;
(:~
 : Returns the natural logarithm of the argument.
 :
 : The result is the natural logarithm of <code>$arg</code>, as defined in the
 : IEEE 754-2008 specification of the <code>log</code> function applied to
 : 64-bit binary floating point values.
 :)
declare %a:since("marklogic", "5.0") function math:log($arg as xs:double) as xs:double external;
(:~
 : Returns the base-ten logarithm of the argument.
 :
 : The result is the base-10 logarithm of <code>$arg</code>, as defined in the
 : IEEE 754-2008 specification of the <code>log10</code> function applied to
 : 64-bit binary floating point values.
 :)
declare %a:since("marklogic", "5.0") function math:log10($arg as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:median($arg as xs:double*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:mode($arg as xs:anyAtomicType*) as xs:anyAtomicType* external;
declare %a:since("marklogic", "6.0") function math:mode($arg as xs:anyAtomicType*, $options as xs:string*) as xs:anyAtomicType* external;
declare %a:restrict-until("return", "marklogic", "8.0", "(xs:double,xs:double)")
        %a:restrict-since("return", "marklogic", "8.0", "(xs:double,xs:integer)")
        %a:since("marklogic", "5.0") function math:modf($x as xs:double) as (xs:double,(xs:double|xs:integer)) external;
declare %a:since("marklogic", "6.0") function math:percent-rank($arg as xs:anyAtomicType*, $value as xs:anyAtomicType) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:percent-rank($arg as xs:anyAtomicType*, $value as xs:anyAtomicType, $options as xs:string*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:percentile($arg as xs:double*, $p as xs:double*) as xs:double* external;
(:~
 : Returns an approximation to the mathematical constant π.
 :
 : This function was replaced by <code>math:pi()</code> in MarkLogic 7.0.
 :
 : This function returns the <code>xs:double</code> value whose lexical
 : representation is 3.14159265358979e0.
 :)
declare %a:since("marklogic", "7.0") function math:pi() as xs:double external;
(:~
 : Returns the value of x<sup>y</sup>.
 :
 : The result is the value of <code>$x</code> raised to the power of <code>$y</code>
 : as defined in the IEEE 754-2008 specification of the <code>pow</code> function
 : applied to two 64-bit binary floating point values.
 :)
declare %a:since("marklogic", "5.0") function math:pow($x as xs:double, $y as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:radians($x as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:rank($arg1 as xs:anyAtomicType*, $arg2 as xs:anyAtomicType) as xs:integer? external;
declare %a:since("marklogic", "6.0") function math:rank($arg1 as xs:anyAtomicType*, $arg2 as xs:anyAtomicType, $options as xs:string*) as xs:integer? external;
(:~
 : Returns the sine of the argument. The argument is an angle in radians.
 :
 : The result is the sine of <code>$θ</code> (which is treated as an angle in
 : radians) as defined in the IEEE 754-2008 specification of the <code>sin</code>
 : function applied to 64-bit binary floating point values.
 :
 : <h1>Notes</h1>
 :
 : If <code>$θ</code> is positive or negative zero, the result is <code>$θ</code>.
 :
 : If <code>$θ</code> is positive or negative infinity, the dynamic error
 : <code>XDMP-DOMAIN</code> is produced.
 :
 : If <code>$θ</code> is <code>NaN</code>, then the result is <code>NaN</code>.
 :
 : Otherwise the result is always in the range -1.0e0 to +1.0e0.
 :)
declare %a:since("marklogic", "5.0") function math:sin($θ as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:sinh($x as xs:double) as xs:double external;
(:~
 : Returns the non-negative square root of the argument.
 :
 : The result is the mathematical non-negative square root of <code>$arg</code>
 : as defined in the IEEE 754-2008 specification of the <code>squareRoot</code>
 : function applied to 64-bit binary floating point values.
 :
 : <h1>Notes</h1>
 :
 : If <code>$arg</code> is positive or negative zero, positive infinity, or
 : <code>NaN</code>, then the result is <code>$arg</code>. (Negative zero is
 : the only case where the result can have negative sign.)
 :
 : If <code>$arg</code> is negative infinity, the dynamic error
 : <code>XDMP-DOMAIN</code> is produced.
 :)
declare %a:since("marklogic", "5.0") function math:sqrt($x as xs:double) as xs:double external;
declare %a:since("marklogic", "6.0") function math:stddev($arg as xs:double*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:stddev-p($arg as xs:double*) as xs:double? external;
(:~
 : Returns the tangent of the argument. The argument is an angle in radians.
 :
 : The result is the tangent of <code>$θ</code> (which is treated as an angle in
 : radians) as defined in the IEEE 754-2008 specification of the <code>tan</code>
 : function applied to 64-bit binary floating point values.
 :
 : <h1>Notes</h1>
 :
 : If <code>$θ</code> is positive or negative zero, the result is <code>$θ</code>.
 :
 : If <code>$θ</code> is positive or negative infinity, the dynamic error
 : <code>XDMP-DOMAIN</code> is produced.
 :
 : If <code>$θ</code> is <code>NaN</code>, then the result is <code>NaN</code>.
 :)
declare %a:since("marklogic", "5.0") function math:tan($θ as xs:double) as xs:double external;
declare %a:since("marklogic", "5.0") function math:tanh($x as xs:double) as xs:double external;
declare %a:since("marklogic", "8.0") function math:trunc($arg as xs:numeric?) as xs:numeric? external;
declare %a:since("marklogic", "6.0") function math:trunc($arg as xs:numeric?, $n as xs:integer) as xs:numeric? external;
declare %a:since("marklogic", "6.0") function math:variance($arg as xs:double*) as xs:double? external;
declare %a:since("marklogic", "6.0") function math:variance-p($arg as xs:double*) as xs:double? external;
