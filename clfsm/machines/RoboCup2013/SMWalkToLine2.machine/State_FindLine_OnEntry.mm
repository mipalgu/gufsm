VisionObjects obj = objects.get();
lineY = -1;

for(VisionObjectTypes::object i = VisionObjectTypes::Line1; i<VisionObjectTypes::Line5; ++i) {
	SimpleLine *line = obj.Line(i);
	if(line == NULL)
		continue;
	short m1 = line->start.y;
	short m2 =    line->end.y;
	short y = std::max(m1, m2);
	if(y > lineY && fabs(line->Gradiant()) < 0.4) {
		lineY = y;
	}
}

foundLine = foundLine || lineY != -1;
