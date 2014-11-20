count = 0;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, static_cast<int64_t>(5 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0UL), ^{
	    std::cout << "SpeedTest failed." << std::endl;
            exit(EXIT_FAILURE);
        });
