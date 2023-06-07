const shortNumber = (num:number) => {
    num = +num.toString().replace(/[^0-9.]/g, '');
    if (num < 1000) {
        return num;
    }
    let abbr = [
      {v: 1E3, s: "K"},
      {v: 1E6, s: "M"},
      ];
    let index:number;
    for (index = abbr.length - 1; index > 0; index--) {
        if (num >= abbr[index].v) {
            break;
        }
    }
    return (num / abbr[index].v).toFixed(2).replace(/\.0+$|(\.[0-9]*[1-9])0+$/, "$1") + abbr[index].s;
};
export default shortNumber;