using LTCareRate.Models.DataModel;

namespace LTCareRate.Models.ViewModel
{
    public class CaseSvrEffView : CaseSvrEff
    {
        public decimal? _01UpAvgDays { get; set; }
        public decimal? _02UpCasePer { get; set; }
        public decimal? _03UpCasePer { get; set; }
    }
}