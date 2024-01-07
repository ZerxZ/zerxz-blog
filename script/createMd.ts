import  enquirer from "enquirer";
import { stringify } from "yaml";
import { writeFileSync,readdirSync,existsSync } from "fs";
import { resolve } from "path";
import folderJson  from "./folder.json";
import tagsJson  from "./tags.json";
interface Folder {
    name: string;
    value: string;
}
interface Tags {
    tag: string[];
    tags: string[];
    categories: string[];
    [key: string]: string[] | any;
}
const folder = folderJson as Folder[];
const tagJsonList = tagsJson as Tags;
const prompt = enquirer.prompt;
interface ResponseTitle {
    folderpath?: string;
    filename?: string;
    title: string;
}

interface ResponseTag {
    [key: string]: string[] | any;
}
interface ResponseDecription {
    description?: string;
    descriptionHtml?: string;
}
console.log(folder);
const response = await prompt<ResponseTitle>([
    {
        type: "autocomplete",
        name: 'folderpath',
        message: '请你选择文章的文件夹?',
        choices: folder,
        
    },
    {
        type: "input",
        name: 'filename',
        message: '请你输入文章的文件名?'
    },
    {
        type: "input",
        name: 'title',
        message: '请你输入文章的标题?'
    },
    
]);
const responseTag:ResponseTag = {}
const tags = [
    {name:"tag",message:"请输入主文章的标签?"},
    {name:"tags",message:"请输入子文章的标签?"},
    {name:"categories",message:"请输入类型文章的标签?"}
];
for (const {name:tag,message} of tags) {
    const { tagType } = await prompt<{ tagType: boolean }>({
        type: "confirm",
        name: "tagType",
        message,
        enabled:true,
        disabled:false,
    });
    if(!tagType){
        continue;
    }
    responseTag[tag] = await prompt<ResponseTag>({
        type:  "multiselect",
        name: tag,
        message: "请输入标签?",
        choices:tagJsonList[tag],
    });
}
const responseisDecription = await prompt(
    {
        type:"confirm",
        name:"isDescription",
        message:"是否需要输入文章描述?",
        enabled:true,
        disabled:false,
    }
)
let ResponseDecription:ResponseDecription = {
};
if((responseisDecription as unknown as { isDescription: boolean }).isDescription){
    const { descriptionType } = await prompt<{ descriptionType: string }>({
        type: "select",
        name: "descriptionType",
        message: "请选择描述类型?",
        choices: [
            "description",
            "descriptionhtml"
        ]
    });
    ResponseDecription = await prompt<ResponseDecription>({
        type: "input",
        name: descriptionType,
        message: "请输入描述?",
    });
}
const { folderpath,filename } = response;
 const mdOptions = Object.assign({
     date: new Date().toLocaleString().replace(/\//g, '-'),
     title: response.title,
 }, responseTag,ResponseDecription);
 const md = `---
${stringify(mdOptions)}
---
`
const dir = resolve(process.cwd(),"docs", folderpath!);
 const filepath = resolve(dir, `${filename}.md`);
 console.log(stringify(mdOptions));
 if (existsSync(dir)) {
        writeFileSync(filepath, md);
 }
// console.log(process.cwd());
// console.log(filepath);