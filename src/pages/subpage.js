export default function Subpage(props){
    return(
    <div>
{props.type === 'subpage-1'?<h1>Sub pagage section1</h1>:""}
{props.type === 'subpage-2'?<h1>Sub pagage section2</h1>:""}

    </div>
);}