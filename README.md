# GoGet Flutter Task

### Notes on the implementation:

- It wasn't clear to me whether there should be a distinction between complete and incomplete jobs within the system by presenting each category separately or allowing some actions (i.e., modifying expenses associated with the job) on one category while preventing those actions on the other. Therefore, I decided to treat all jobs similarly.

- It wasn't clear to me whether a job's fee is supposed to contribute positively or negatively to the net earning. So, I considered it to be contributing positively.

- The cost of a job is the summation of the cost of each expense associated with this particualr job.

- Job's net earning is calculated as follows: 

        net earning = fee + commission - total cost
