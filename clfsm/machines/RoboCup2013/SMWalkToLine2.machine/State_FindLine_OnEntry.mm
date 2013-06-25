VisionObjects obj = objects.get();
lineY = -1;
VisionObjectTypes::object lineIndex = VisionObjectTypes::Line1;

for(VisionObjectTypes::object i = VisionObjectTypes::Line1; i<VisionObjectTypes::Line5; ++i) {
	SimpleLine *line = obj.Line(i);
	lineM1 = lineM2 = 0;
	if(line == NULL)
		continue;
	short m1 = line->start.y;
	short m2 =    line->end.y;
	short y = std::max(m1,m2);
	std::cout << "Y: " << y  << "Grad: " << line->Gradiant() << std::endl;
	if(y > lineY && fabs(line->Gradiant()) < 2.0) {
		lineY = y;
		lineIndex = i;
		lineM1 = m1;
		lineM2 = m2;
		std::cout << "lineM1: " << lineM1 << " - " << "lineM2: " << lineM2 << std::endl;
		std::cout << "selected\n";
	}
}

if(lineY != -1)
	std::cout << "GRADIENT: " << obj.Line(lineIndex)->Gradiant() << "LINE Y: " << lineY << std::endl;

foundLine = foundLine || lineY != -1;

if(lineY == -1)
	lineY = LINE_Y_DIST;
