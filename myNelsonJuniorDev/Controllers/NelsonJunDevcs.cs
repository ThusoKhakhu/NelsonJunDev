using System.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace myNelsonJuniorDev.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NelsonJunDevcs : ControllerBase
    {






        //View model
        public class DataVM
        {
            public string inputData {  get; set; }  
        }


        //Add method
        [HttpPost]
        [Route("Receive")]
        public async Task<IActionResult> Add([FromBody] DataVM bodyData)
        {

            bodyData.inputData = "example";


            var newArray = bodyData.inputData.ToCharArray(); //Converting the input data into an array

            var sortArray = newArray.OrderBy(s => s).ToArray(); // Sorting the array in alphabetic order

            return Ok(new {word = sortArray}); //Return sorted array
        }



    }
}
