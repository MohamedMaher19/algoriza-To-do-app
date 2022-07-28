class Task {
  int ? id;
  String ? title;
  String ? status;
  String ? date;
  int ? isCompleted;
  String ? startTime;
  String ? endTime;
  int ? color;
  int ? remind;
  String ? repeat;

  Task({
    this.status,
    this.id,
    this.title,
    this.date,
    this.isCompleted,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
});


  Task.fromJson(Map<String , dynamic> json){
    id = json['id'];
    title = json['title'];
    date = json['date'];
    isCompleted = json['isCompleted'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
    status = json['status'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    data['status'] = this.status;
    return data;
  }








}