function _show_wareki() {
    _cat_wareki_data | grep ${1:-$(date '+%Y')}
}
alias wareki='_show_wareki'

function _cat_wareki_data() {
cat << EOS
明治10年,1877
明治11年,1878
明治12年,1879
明治13年,1880
明治14年,1881
明治15年,1882
明治16年,1883
明治17年,1884
明治18年,1885
明治19年,1886
明治20年,1887
明治21年,1888
明治22年,1889
明治23年,1890
明治24年,1891
明治25年,1892
明治26年,1893
明治27年,1894
明治28年,1895
明治29年,1896
明治30年,1897
明治31年,1898
明治32年,1899
明治33年,1900
明治34年,1901
明治35年,1902
明治36年,1903
明治37年,1904
明治38年,1905
明治39年,1906
明治40年,1907
明治41年,1908
明治42年,1909
明治43年,1910
明治44年,1911
明治45年,1912
大正元年,1912
大正2年,1913
大正3年,1914
大正4年,1915
大正5年,1916
大正6年,1917
大正7年,1918
大正8年,1919
大正9年,1920
大正10年,1921
大正11年,1922
大正12年,1923
大正13年,1924
大正14年,1925
大正15年,1926
昭和元年,1926
昭和2年,1927
昭和3年,1928
昭和4年,1929
昭和5年,1930
昭和6年,1931
昭和7年,1932
昭和8年,1933
昭和9年,1934
昭和10年,1935
昭和11年,1936
昭和12年,1937
昭和13年,1938
昭和14年,1939
昭和15年,1940
昭和16年,1941
昭和17年,1942
昭和18年,1943
昭和19年,1944
昭和20年,1945
昭和21年,1946
昭和22年,1947
昭和23年,1948
昭和24年,1949
昭和25年,1950
昭和26年,1951
昭和27年,1952
昭和28年,1953
昭和29年,1954
昭和30年,1955
昭和31年,1956
昭和32年,1957
昭和33年,1958
昭和34年,1959
昭和35年,1960
昭和36年,1961
昭和37年,1962
昭和38年,1963
昭和39年,1964
昭和40年,1965
昭和41年,1966
昭和42年,1967
昭和43年,1968
昭和44年,1969
昭和45年,1970
昭和46年,1971
昭和47年,1972
昭和48年,1973
昭和49年,1974
昭和50年,1975
昭和51年,1976
昭和52年,1977
昭和53年,1978
昭和54年,1979
昭和55年,1980
昭和56年,1981
昭和57年,1982
昭和58年,1983
昭和59年,1984
昭和60年,1985
昭和61年,1986
昭和62年,1987
昭和63年,1988
昭和64年,1989
平成元年,1989
平成2年,1990
平成3年,1991
平成4年,1992
平成5年,1993
平成6年,1994
平成7年,1995
平成8年,1996
平成9年,1997
平成10年,1998
平成11年,1999
平成12年,2000
平成13年,2001
平成14年,2002
平成15年,2003
平成16年,2004
平成17年,2005
平成18年,2006
平成19年,2007
平成20年,2008
平成21年,2009
平成22年,2010
平成23年,2011
平成24年,2012
平成25年,2013
平成26年,2014
平成27年,2015
平成28年,2016
平成29年,2017
平成30年,2018
平成31年,2019
令和元年,2019
令和2年,2020
令和3年,2021
令和4年,2022
令和5年,2023
令和6年,2024
令和7年,2025
令和8年,2026
令和9年,2027
令和10年,2028
EOS
}
