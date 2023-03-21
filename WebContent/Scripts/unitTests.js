var  testvaluesReferral =[[1,2,3],
						  [3,4,5]];

const testvaluesAppraisal =[1,2];
const testvaluesTRS =[1,3];

const testAllValuesRef = () =>{
    testvaluesReferral.forEach(function (item, index){
    testReferral(item);
})
}

const testReferral = (arr)=>{
    NextStepTransaction();
}
